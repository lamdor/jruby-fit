module Fit
  class TypeConverter
    def self.convert(value, type)
      case type
      when :string
        value.to_s
      when :numeric
        value.to_i
      end
    end
  end
end
