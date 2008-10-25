require File.join(File.dirname(__FILE__), *%w[.. spec_helper])
require "fit/type_converter"

describe Fit::TypeConverter do
  
  it "should be able to covert '3' to the numeric 3" do
    Fit::TypeConverter.convert("3", :numeric).should == 3
  end

  it "should not convert '3' if type to convert is string" do
    Fit::TypeConverter.convert("3", :string).should == "3"
  end

end
