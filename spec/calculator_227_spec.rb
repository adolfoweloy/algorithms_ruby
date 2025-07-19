require_relative "../lib/calculator_227.rb"
require "rspec"

RSpec.describe Calculator227 do
  let(:subject) { Calculator227.new }

  describe "#calculate" do
    it "handles basic addition" do
      expect(subject.calculate("1+2")).to eq(3)
    end

    it "handles basic subtraction" do
      expect(subject.calculate("3-2")).to eq(1)
    end

    it "handles basic multiplication" do
      expect(subject.calculate("2*3")).to eq(6)
    end

    it "handles basic division" do
      expect(subject.calculate("6/2")).to eq(3)
    end

    it "handles expression with spaces" do
      expect(subject.calculate("3+2 * 2")).to eq(7)
    end

    it "handles complex expression with all operators" do
      expect(subject.calculate("3+2*2")).to eq(7)
    end

    it "handles division with remainder" do
      expect(subject.calculate("7/2")).to eq(3)
    end



    it "handles expression starting with negative number" do
      expect(subject.calculate("-2+3")).to eq(1)
    end

    it "handles multiple multiplications and divisions" do
      expect(subject.calculate("2*3*4")).to eq(24)
    end

    it "handles mixed operations with precedence" do
      expect(subject.calculate("1+2*3-4/2")).to eq(5)
    end

    it "handles single number" do
      expect(subject.calculate("42")).to eq(42)
    end

    it "handles empty string" do
      expect(subject.calculate("")).to eq(0)
    end

    it "handles nil input" do
      expect(subject.calculate(nil)).to eq(0)
    end

    it "handles expression with multiple spaces" do
      expect(subject.calculate("  3  +  2  *  2  ")).to eq(7)
    end

    it "handles large numbers" do
      expect(subject.calculate("999*999")).to eq(998001)
    end

    it "handles division by one" do
      expect(subject.calculate("5/1")).to eq(5)
    end

    it "handles multiplication by zero" do
      expect(subject.calculate("5*0")).to eq(0)
    end

    it "handles complex expression from leetcode example" do
      expect(subject.calculate(" 3/2 ")).to eq(1)
    end

    it "handles another leetcode example" do
      expect(subject.calculate(" 3+5 / 2 ")).to eq(5)
    end

    it "handles expression with all four operators" do
      expect(subject.calculate("10-5*2+3/2")).to eq(1)
    end

    it "handles consecutive operations" do
      expect(subject.calculate("1+1+1+1")).to eq(4)
    end

    it "handles multiplication and division precedence" do
      expect(subject.calculate("2*3/2")).to eq(3)
    end

    it "handles negative result" do
      expect(subject.calculate("1-2*3")).to eq(-5)
    end

    it "handles expression with division precedence" do
      expect(subject.calculate("14-3/2")).to eq(13)
    end
  end
end
