module Util
  module CaseHelper
    def self.snake_case(text)
      text.gsub(/([a-z])([A-Z])/, '\1_\2').downcase
    end
  end
end
