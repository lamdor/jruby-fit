require 'fit/binding'

class Fit::ColumnFixture < Java::Fit::ColumnFixture

  def createBinding(column_number, heads)
    Fit::Binding.create(self, heads.text)
  end
  
end
