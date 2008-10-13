require 'java'

require 'util/case_helper'

module Fit
  include_package "fit"

  module Exception
    include_package "fit.exception"
  end
  
  class JRubyFixture < Fixture

    def getLinkedFixtureWithArgs(tables)
      header = tables.at(0,0,0)
      fixture_name = header.text
      fixture = try_to_load_ruby_fixture(fixture_name)
      fixture ||= try_to_load_java_fixture(fixture_name)
      fixture.counts = counts
      fixture.summary = summary
      fixture.getArgsForTable(table)
      return fixture
    end

    def try_to_load_ruby_fixture(fixture_name)
      parts = fixture_name.split(".")
      require file_name_for_parts(parts)
      klass = constant_for_parts(parts)
      return klass.new
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

    def try_to_load_java_fixture(fixture_name)
      begin
      rescue Fit::Exception::NoSuchFixtureException => e
        raise e.cause
      end
    end
    
  end
  
end
