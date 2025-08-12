require_relative "../lib/num_islands.rb"
require "rspec"

RSpec.describe NumIslands do
  let(:subject) { NumIslands.new }

  describe "#num_islands" do
    it "counts islands in a basic grid" do
      grid = [
        ["1","1","1","1","0"],
        ["1","1","0","1","0"],
        ["1","1","0","0","0"],
        ["0","0","0","0","0"]
      ]
      expect(subject.num_islands(grid)).to eq(1)
    end

    it "counts multiple separate islands" do
      grid = [
        ["1","1","0","0","0"],
        ["1","1","0","0","0"],
        ["0","0","1","0","0"],
        ["0","0","0","1","1"]
      ]
      expect(subject.num_islands(grid)).to eq(3)
    end

    it "handles single cell island" do
      grid = [["1"]]
      expect(subject.num_islands(grid)).to eq(1)
    end

    it "handles single cell water" do
      grid = [["0"]]
      expect(subject.num_islands(grid)).to eq(0)
    end

    it "handles all water grid" do
      grid = [
        ["0","0","0"],
        ["0","0","0"],
        ["0","0","0"]
      ]
      expect(subject.num_islands(grid)).to eq(0)
    end

    it "handles all land grid" do
      grid = [
        ["1","1","1"],
        ["1","1","1"],
        ["1","1","1"]
      ]
      expect(subject.num_islands(grid)).to eq(1)
    end

    it "handles diagonal islands (not connected)" do
      grid = [
        ["1","0","1"],
        ["0","1","0"],
        ["1","0","1"]
      ]
      expect(subject.num_islands(grid)).to eq(5)
    end

    it "handles L-shaped island" do
      grid = [
        ["1","1","0"],
        ["1","0","0"],
        ["1","1","1"]
      ]
      expect(subject.num_islands(grid)).to eq(1)
    end

    it "handles rectangular grid with mixed islands" do
      grid = [
        ["1","0","1","1","1"],
        ["1","0","1","0","1"],
        ["1","1","1","0","1"]
      ]
      expect(subject.num_islands(grid)).to eq(1)
    end

    it "handles edge case with nil grid" do
      expect(subject.num_islands(nil)).to eq(0)
    end

    it "handles edge case with empty grid" do
      expect(subject.num_islands([])).to eq(0)
    end

    it "handles edge case with empty rows" do
      grid = [[]]
      expect(subject.num_islands(grid)).to eq(0)
    end

    it "handles single row with multiple islands" do
      grid = [["1","0","1","0","1"]]
      expect(subject.num_islands(grid)).to eq(3)
    end

    it "handles single column with multiple islands" do
      grid = [["1"],["0"],["1"],["0"],["1"]]
      expect(subject.num_islands(grid)).to eq(3)
    end

    it "handles large connected island" do
      grid = [
        ["1","1","1","1","1"],
        ["1","0","0","0","1"],
        ["1","0","1","0","1"],
        ["1","0","0","0","1"],
        ["1","1","1","1","1"]
      ]
      expect(subject.num_islands(grid)).to eq(2)
    end

    it "handles complex pattern from leetcode example 1" do
      grid = [
        ["1","1","1","1","0"],
        ["1","1","0","1","0"],
        ["1","1","0","0","0"],
        ["0","0","0","0","0"]
      ]
      expect(subject.num_islands(grid)).to eq(1)
    end

    it "handles complex pattern from leetcode example 2" do
      grid = [
        ["1","1","0","0","0"],
        ["1","1","0","0","0"],
        ["0","0","1","0","0"],
        ["0","0","0","1","1"]
      ]
      expect(subject.num_islands(grid)).to eq(3)
    end
  end
end
