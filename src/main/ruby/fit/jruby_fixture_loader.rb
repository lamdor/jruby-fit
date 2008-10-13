module Fit
  class JRubyFixtureLoader
    class <<self

      def new_fixture(fixture_name)
        parts = fixture_name.split(/\.|::/)
        require file_name_for_parts(parts)
        constant_for_parts(parts).new
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
      
    end
  end
end
