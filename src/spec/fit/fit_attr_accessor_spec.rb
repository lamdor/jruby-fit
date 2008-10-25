require File.join(File.dirname(__FILE__), *%w[.. spec_helper])

require 'fit/fit_attr_accessor'

class TypedAttributes
  extend Fit::FitAttrAccessor

  fit_attr_accessor :first, :type => :numeric
end

describe Fit::FitAttrAccessor do

  it "should create a writer and a reader that should convert types" do
    typed = TypedAttributes.new
    typed.first = "4"
    typed.first.should == 4
  end
  
end
