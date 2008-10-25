require 'util/public_field_accessor'
require 'fit/fit_attr_accessor'

class Java::Fit::Fixture
  extend Fit::FitAttrAccessor
  include Util::PublicFieldAccessor
end
