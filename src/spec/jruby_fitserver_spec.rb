require File.join(File.dirname(__FILE__), "spec_helper")

import Java::OrgJrubyFit::JRubyFitServer

describe JRubyFitServer do
  describe ".main" do
    it "should create a new JRubyFitServer"
    it "should call run on our JRubyFitServer and pass in ARGV"
    it "should exit with the code that the fitserver wants to exit at"
  end

  describe "#newFixture" do
    it "should return me a JRubyFixture"
  end
end
