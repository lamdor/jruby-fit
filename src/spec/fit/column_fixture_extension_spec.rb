require File.join(File.dirname(__FILE__), *%w[.. spec_helper])

describe Fit::ColumnFixture do
  before :each do
    @fixture = Fit::ColumnFixture.new
  end

  it "should call Fit::Binding.create to create the binding" do
    Fit::Binding.should_receive(:create).with(@fixture, "first").and_return("a binding")
    heads = Java::Fit::Parse.new("<table><tr><td>first</td></tr></table>").at(0,0,0)
    @fixture.createBinding(1, heads)
  end
  
end
