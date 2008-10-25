module Eg
  module Fixtures
    class AdditionFixture < Fit::ColumnFixture
      fit_attr_accessor :first, :type => :numeric
      fit_attr_accessor :second, :type => :numeric

      def result
        first + second
      end
    end
  end
end
