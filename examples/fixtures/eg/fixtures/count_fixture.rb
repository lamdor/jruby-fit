module Eg
  module Fixtures
    class CountFixture < Fit::ActionFixture

      fit_attr_accessor :counter, :type => :numeric

      def initialize
        @counter = 0
      end

      def count
        @counter += 1
      end
      
    end
  end
end
