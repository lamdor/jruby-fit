module Fit::Binding

  def self.create(fixture, name)

    if name[-1,1] == "?"
      fit_binding = MethodBinding.new
      fit_binding.method = name[0..-2]
    else
      fit_binding = AccessorBinding.new
      fit_binding.name = name
    end
    fit_binding
  end

  class MethodBinding < Java::Fit::Binding
    attr_writer :method

    def doCell(fixture, cell)
      expected = cell.text 
      actual = fixture.send @method
      if actual.to_s != expected
        fixture.wrong(cell, actual.to_s)
      else
        fixture.right(cell)
      end
    end
  end

  class AccessorBinding < Java::Fit::Binding
    def name=(name)
      @name = name
      @writer_method_name = @name + "="
    end
    
    def doCell(fixture, cell)
      fixture.send @writer_method_name, cell.text
    end
  end
end
