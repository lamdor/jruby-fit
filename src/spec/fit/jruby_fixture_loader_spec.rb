require File.join(File.dirname(__FILE__), *%w[.. spec_helper])

require 'fit/jruby_fixture_loader'

module Eg
  class AnotherFixture;  end
end


describe Fit::JRubyFixtureLoader do

  describe ".new_fixture" do

    ["eg.fixtures.AdditionFixture","Eg::Fixtures::AdditionFixture"].each do |fixture_pattern|
      it "should be able to resolve #{fixture_pattern}" do
        fixture = Fit::JRubyFixtureLoader.new_fixture(fixture_pattern)
        fixture.should be_instance_of(Eg::Fixtures::AdditionFixture)
      end
    end

    it "doesn't blow up if it can't find the fixture" do
      fixture = Fit::JRubyFixtureLoader.new_fixture("Eg::AnotherFixture")
      fixture.should be_an_instance_of(Eg::AnotherFixture)
    end

    
  end
  
end
