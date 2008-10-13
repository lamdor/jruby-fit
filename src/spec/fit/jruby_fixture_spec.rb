require File.join(File.dirname(__FILE__), "../spec_helper")

require 'fit/jruby_fixture'

describe Fit::JRubyFixture do

  def test_table
    Fit::Parse.new("<table><tr><td>eg.fixtures.AdditionFixture</td></tr></table>")
  end
  
  it "should load a JRubyFixture " do
    parent_fixture = Fit::JRubyFixture.new
    fixture = parent_fixture.getLinkedFixtureWithArgs(test_table)
    fixture.should be_a(Eg::Fixtures::AdditionFixturep)
  end
end
