module Fit
  include_package "fit"

  module Exception
    include_package "fit.exception"
  end
  
end

require 'fit/fixture_extension'
