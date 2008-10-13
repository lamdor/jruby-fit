require File.join(File.dirname(__FILE__), *%w[.. spec_helper])

require 'fit/jruby_fixture_loader'

describe Fit::JRubyFixtureLoader do

  describe ".new_fixture" do

    ["eg.fixtures.AdditionFixture"].each do |fixture_pattern|
      it "should be able to resolve #{fixture_pattern}" do
        fixture = Fit::JRubyFixtureLoader.new_fixture(fixture_pattern)
        fixture.should be_instance_of(Eg::Fixtures::AdditionFixture)
      end
    end

    
  end
  
end
