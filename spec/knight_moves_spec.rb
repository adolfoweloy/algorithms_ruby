require_relative "../lib/knight_moves.rb"
require "rspec"

RSpec.describe KnightMoves do

  before(:each) do
    @subj = KnightMoves.new
  end

  it "case 1: one move is required" do
    result = @subj.min_knight_moves(2, 1)
    expect(result).to eq(1)
  end

  it "case 2: four moves required to achieve (5,5)" do
    result = @subj.min_knight_moves(5, 5)
    expect(result).to eq(4)
  end

  it "case 3: moves to achieve (0,1)" do
    result = @subj.min_knight_moves(0, 1)
    expect(result).to eq(3)
  end
end
