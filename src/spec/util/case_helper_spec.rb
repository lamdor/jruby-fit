require File.join(File.dirname(__FILE__), "../spec_helper")

require 'util/case_helper'

describe Util::CaseHelper do
  describe ".snake_case" do
    it "should convert abc to abc" do
      Util::CaseHelper.snake_case("abc").should == "abc"
    end
    it "should convert Abc to abc" do
      Util::CaseHelper.snake_case("Abc").should == "abc"
    end
    it "should convert AbcDef to abc_def" do
      Util::CaseHelper.snake_case("AbcDef").should == "abc_def"
    end
  end
end
