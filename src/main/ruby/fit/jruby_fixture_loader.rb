require 'util/case_helper'

module Fit
  class FixtureNotFoundExecption < ::Exception; end
  
  class JRubyFixtureLoader
    class <<self

      def new_fixture(fixture_name)
        klass = find_klass(fixture_name) || find_klass(fixture_name + "Fixture")
        raise Fit::FixtureNotFoundExecption if klass.nil?
        klass.new
       end

       def find_klass(fixture_name)
        parts = fixture_name.split(/\.|::/)
        try_to_require file_name_for_parts(parts)
        begin
          constant_for_parts(parts)
        rescue NameError
          nil
        end
      end

      def file_name_for_parts(parts)
        parts.map { |part| Util::CaseHelper.snake_case(part) }.join("/")
      end

      def constant_for_parts(parts)
        fixture_part = parts.pop
        mod = parts.inject(Kernel) do |constant, path_element|
          constant.const_get(path_element.capitalize)
        end
        mod.const_get(fixture_part)
      end

      def try_to_require(file)
        begin
          require file
        rescue LoadError => e
            # do nothing
        end
      end
      
    end
  end
end
