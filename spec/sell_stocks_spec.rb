require_relative "../lib/sell_stocks.rb"
require "rspec"

RSpec.describe SellStocks do
  before(:each) do
    @subj = SellStocks.new
  end

  it "case: 1" do
    result = @subj.max_profit([7,1,5,3,6,4])
    expect(result).to eq(5)
  end

  it "case: 2" do
    result = @subj.max_profit([7,6,4,3,1])
    expect(result).to eq(0)
  end

end
