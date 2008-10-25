require File.join(File.dirname(__FILE__), *%w[.. spec_helper])

require 'fit/fit'
require 'fit/binding'

class BindingTestFixture < Fit::Fixture
  attr_accessor :first, :second

  def sum
    first + second
  end
end

describe Fit::Binding do

  before :each do
    @fixture = BindingTestFixture.new
  end

  describe ".create" do

    it "should create a method binding if name ends with ?" do
      binding = Fit::Binding.create(@fixture, "sum?")
      binding.should be_an_instance_of(Fit::Binding::MethodBinding)
    end
    
    it "should create an accessor binding if name does not end with ?" do
      binding = Fit::Binding.create(@fixture, "first")
      binding.should be_an_instance_of(Fit::Binding::AccessorBinding)
    end
  end

  describe Fit::Binding::MethodBinding do

    before :each do
      @fixture.first = 1
      @fixture.second = 3
      @binding = Fit::Binding.create(@fixture, "sum?")
    end

    it "should be a subclass of Java::Fit::Binding" do
      @binding.should be_is_a(Java::Fit::Binding)
    end

    it "should invoke sum? and if it is wrong tell the fixture" do
      cell = Java::Fit::Parse.new("<table><tr><td>5</td></tr></table>").at(0,0,0)
      @fixture.should_receive(:wrong).with(cell, "4")
      @binding.doCell(@fixture, cell)
    end    

    it "should invoke sum? and if it is right tell the fixture" do
      cell = Java::Fit::Parse.new("<table><tr><td>4</td></tr></table>").at(0,0,0)
      @fixture.should_receive(:right).with(cell)
      @binding.doCell(@fixture, cell)
    end    
  end

  describe Fit::Binding::AccessorBinding do
    before :each do
      @binding = Fit::Binding.create(@fixture, "first")
    end
    
    it "should be a subclass of Java::Fit::Binding" do
      @binding.should be_is_a(Java::Fit::Binding)
    end
    
    it "should invoke the write accessor of the property" do
      cell = Java::Fit::Parse.new("<table><tr><td>5</td></tr></table>").at(0,0,0)
      @binding.doCell(@fixture, cell)
      @fixture.first.should == "5"
    end
  end

end
