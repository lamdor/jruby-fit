require File.join(File.dirname(__FILE__), *%w[.. spec_helper])

require 'util/public_field_accessor'

class Java::Eg::UtilPublicFieldAccessorParent
  include Util::PublicFieldAccessor
end

class NotAJavaClass
end

describe Util::PublicFieldAccessor do

  it "should create accessors for the java classes public fields" do
    instance = Java::Eg.UtilPublicFieldAccessorParent.new
    instance.name = "Awesome"
    instance.number = 42

    instance.name.should == "Awesome"
    instance.number.should == 42
  end

  it "should raise 'not a Java class' if it isn't a JavaProxy" do
    lambda do
      class NotAJavaClass
        include Util::PublicFieldAccessor
      end
    end.should raise_error("not a Java class")
  end
  
end
