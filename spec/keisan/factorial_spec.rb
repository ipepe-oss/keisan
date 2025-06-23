require "spec_helper"

RSpec.describe "Factorial operator" do
  it "evaluates correctly" do
    calculator = Keisan::Calculator.new
    expect(calculator.evaluate("5!")).to eq 120
    expect(calculator.evaluate("(3+2)!")).to eq 120
    expect(calculator.evaluate("0!")).to eq 1
  end
end
