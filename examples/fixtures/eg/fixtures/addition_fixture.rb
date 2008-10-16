module Eg
  module Fixtures
    class AdditionFixture < Fit::ColumnFixture
      attr_accessor :first, :second
      
      def result
        first.to_i + second.to_i
      end
    end
  end
end
