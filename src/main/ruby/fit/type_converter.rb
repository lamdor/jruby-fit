module Fit
  class TypeConverter
    @converter_types = { }

    def self.register(converter, identifier)
      raise "#{converter} does not have a parse(value) method" unless converter.respond_to?(:parse)
      @converter_types[identifier] = converter
    end

    def self.convert(value, type)
      @converter_types[type].parse(value)
    end

    class NumericConverter
      def self.parse(value)
        value.to_i
      end
    end

    class StingConverter
      def self.parse(value)
        value.to_s
      end
    end

    register NumericConverter, :numeric
    register StingConverter, :string
    
  end
end
