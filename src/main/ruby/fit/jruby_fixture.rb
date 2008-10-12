require 'java'

module Fit
  include_package "fit"
  
  class JRubyFixture < Fixture

    def getLinkedFixtureWithArgs(tables)
      header = tables.at(0,0,0)
      fixture_name = header.text
      fixture = Fit::FixtureLoader.instance.disgraceThenLoad(fixture_name)
      fixture.counts = counts
      fixture.summary = summary
      fixture.getArgsForTable(table)
      return fixture
    end
    
  end
  
end
