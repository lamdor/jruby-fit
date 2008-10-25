require "fit/type_converter"

module Fit::FitAttrAccessor
  def fit_attr_accessor(name, options = { })
    attr_reader name
    @@attr_types ||= { }
    @@attr_types[name] = options[:type]
    class_eval do
      define_method "#{name}=" do |val|
        instance_variable_set "@#{name}", Fit::TypeConverter.convert(val, @@attr_types[name])
      end
    end
  end
end
