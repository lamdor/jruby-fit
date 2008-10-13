module Eg
  module Fixtures
    class AdditionFixture < Fit::ColumnFixture
      attr_accessor :first, :second
      
      def result
        first + second
      end
    end
  end
end
