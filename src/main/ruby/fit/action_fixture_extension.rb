class Fit::ActionFixture < Java::Fit::ActionFixture

  def doCells(cells)
    @cells = cells
    action = @cells.text
    send action
  end
  
  def start
    fixture_name = @cells.more.text
    @actor = Fit::JRubyFixtureLoader.new_fixture(fixture_name)
  end

  def enter
    attr = @cells.more.text
    value = @cells.more.more.text
    @actor.send "#{attr}=", value
  end

  def press
    @actor.send @cells.more.text
  end

  def check
    actual = @actor.send(@cells.more.text)
    last_cell = @cells.more.more
    expected = last_cell.text
    if actual.to_s == expected.to_s
      right(last_cell)
    else
      wrong(last_cell, actual.to_s)
    end
  end
  
end
