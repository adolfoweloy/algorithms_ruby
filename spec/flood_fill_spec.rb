require_relative "../lib/flood_fill.rb"
require "rspec"

RSpec.describe FloodFill do
  let(:subject) { FloodFill.new }

  describe "#flood_fill" do
    it "fills connected cells with new color" do
      image = [[1,1,1],[1,1,0],[1,0,1]]
      sr = 1
      sc = 1
      color = 2
      expected = [[2,2,2],[2,2,0],[2,0,1]]
      expect(subject.flood_fill(image, sr, sc, color)).to eq(expected)
    end

    it "handles single cell image" do
      image = [[0]]
      sr = 0
      sc = 0
      color = 2
      expected = [[2]]
      expect(subject.flood_fill(image, sr, sc, color)).to eq(expected)
    end

    it "fills all zeros in rectangular image" do
      image = [[0,0,0],[0,0,0]]
      sr = 0
      sc = 0
      color = 0
      expected = [[0,0,0],[0,0,0]]
      expect(subject.flood_fill(image, sr, sc, color)).to eq(expected)
    end

    it "handles edge case with nil image" do
      expect(subject.flood_fill(nil, 0, 0, 1)).to eq([])
    end

    it "handles edge case with empty image" do
      expect(subject.flood_fill([], 0, 0, 1)).to eq([])
    end
  end
end
