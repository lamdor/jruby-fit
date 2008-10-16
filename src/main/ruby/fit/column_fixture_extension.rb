require 'fit/binding'

class Fit::ColumnFixture < Java::Fit::ColumnFixture

  def createBinding(column_number, heads)
    @bindings ||= []
    binding = Fit::Binding.create(self, heads.text)
    @bindings << binding
    return binding
  end

  def doCell(cell, column)
    @bindings[column].doCell(self, cell)
  end
  
end
