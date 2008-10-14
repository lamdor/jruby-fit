require 'java'

require 'util/case_helper'
require 'util/public_field_accessor'
require 'fit/jruby_fixture_loader'

module Fit
  include_package "fit"

  module Exception
    include_package "fit.exception"
  end

  class JRubyFixture < Fixture
    
    def getLinkedFixtureWithArgs(tables)
      header = tables.at(0,0,0)
      fixture_name = header.text
      fixture = try_to_load_ruby_fixture(fixture_name) || try_to_load_java_fixture(fixture_name)
      fixture.counts = counts
      fixture.summary = summary
      fixture.getArgsForTable(tables)
      return fixture
    end

    def try_to_load_ruby_fixture(fixture_name)
      Fit::JRubyFixtureLoader.new_fixture(fixture_name)
    end

    def try_to_load_java_fixture(fixture_name)
      begin
      rescue Fit::Exception::NoSuchFixtureException => e
        raise e.cause
      end
    end
    
  end
  
end

class Fit::Fixture
  include Util::PublicFieldAccessor
end
