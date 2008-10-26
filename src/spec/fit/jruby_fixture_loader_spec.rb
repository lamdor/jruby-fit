require File.join(File.dirname(__FILE__), *%w[.. spec_helper])

module Eg
  class AnotherFixture;  end
end

class ModuleLessFixture; end

describe Fit::JRubyFixtureLoader do

  describe ".new_fixture" do

    ["eg.fixtures.AdditionFixture","Eg::Fixtures::AdditionFixture", "eg.fixtures.Addition"].each do |fixture_pattern|
      it "should be able to resolve #{fixture_pattern}" do
        fixture = Fit::JRubyFixtureLoader.new_fixture(fixture_pattern)
        fixture.should be_instance_of(Eg::Fixtures::AdditionFixture)
      end
    end

    it "doesn't blow up with a load error if it can't find the fixture file" do
      fixture = Fit::JRubyFixtureLoader.new_fixture("Eg::AnotherFixture")
      fixture.should be_an_instance_of(Eg::AnotherFixture)
    end

    it "should blow up with a FixtureNotFoundExecption if it can't find it" do
      lambda { Fit::JRubyFixtureLoader.new_fixture("Eg::NotExistentFixture") }.should raise_error(Fit::FixtureNotFoundExecption)
    end

    it "should be able to load up a module-less fixture" do
      fixture = Fit::JRubyFixtureLoader.new_fixture("ModuleLessFixture")
      fixture.should be_an_instance_of(ModuleLessFixture)
    end
    
  end
  
end
