require 'java'

module Fit
  include_package "fit"

  module Exception
    include_package "fit.exception"
  end
  
end

require 'fit/fixture_extension'
require 'fit/column_fixture_extension'
require 'fit/action_fixture_extension'
