module Util
  module PublicFieldAccessor
    def self.included(klass)
      raise "not a Java class" unless klass.ancestors.include? JavaProxy
      java_klass = klass.java_class
      java_klass.declared_fields.each do |field|
        if field.modifiers % 2 == 1
          klass.class_eval do
            define_method "#{field.name}=" do |new_value|
              field.set_value(self, new_value)
            end
            define_method "#{field.name}" do
              field.value(self)
            end
          end
        end
      end
    end
  end
end
