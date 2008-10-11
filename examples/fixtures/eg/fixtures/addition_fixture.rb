class AdditionFixture < Fit::ColumnFixture
  attr_accessor :first, :second

  def result
    first + second
  end
end
