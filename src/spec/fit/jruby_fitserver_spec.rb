require File.join(File.dirname(__FILE__), "../spec_helper")

#import Java::Fit::JRubyFitServer

# todo: how do test this java class
describe Java::Fit::JRubyFitServer do
  it "should be a fitserver"
  describe ".main" do
    it "should call run on our JRubyFitServer and pass in ARGV"
    it "should exit with the code that the fitserver wants to exit at"
  end

  describe "#newFixture" do
    it "should return me a JRubyFixture"
  end
end
