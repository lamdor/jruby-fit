require File.join(File.dirname(__FILE__), *%w[.. spec_helper])

describe Fit::TypeConverter do
  
  it "should be able to covert '3' to the numeric 3" do
    Fit::TypeConverter.convert("3", :numeric).should == 3
  end

  it "should not convert '3' if type to convert is string" do
    Fit::TypeConverter.convert("3", :string).should == "3"
  end

  it "should be able to register custom converters as long as the convert has a parse method" do
    class Dollar
      attr_reader :amount
      def initialize(amount)
        @amount = amount
      end
    end

    class DollarConverter
      def self.parse(value)
        Dollar.new(value)
      end
    end

    Fit::TypeConverter.register(DollarConverter, :dollar)

    converted = Fit::TypeConverter.convert("3", :dollar)

    converted.should be_instance_of(Dollar)
    converted.amount.should == "3"
  end
    
  it "should raise 'BadConverter does not have a parse(value) method' if the converter of course doesn't have it" do
    class BadConverter
    end
    lambda { Fit::TypeConverter.register BadConverter, :somethign }.should raise_error('BadConverter does not have a parse(value) method')
  end

end
