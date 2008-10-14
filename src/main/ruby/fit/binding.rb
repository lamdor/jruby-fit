module Fit::Binding

  def self.create(fixture, name)
    if name[-1,1] == "?"
      MethodBinding.new
    else
      AccessorBinding.new(name)
    end
  end

  class MethodBinding < Java::Fit::Binding
    def doCell(fixture, cell)
      method_name = cell.text.gsub("?", "")
      fixture.send method_name
    end
  end

  class AccessorBinding < Java::Fit::Binding

    def self.new(name)
      allocate.send :initialize, name
    end

    def initialize(name)
      @name = name
      @writer_method_name = @name + "="
      self
    end

    def doCell(fixture, cell)
      fixture.send @writer_method_name, cell.text
    end
  end
end
