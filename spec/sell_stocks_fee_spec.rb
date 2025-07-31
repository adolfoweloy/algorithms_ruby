require_relative "../lib/sell_stocks_fee.rb"
require "rspec"

RSpec.describe SellStocksFee do

  before(:each) do
    @subj = SellStocksFee.new
  end

  it "case 1: buy and sell twice" do
    result = @subj.max_profit([1,3,2,8,4,9], 2)
    expect(result).to eq(8)
  end

  it "case 2: buy and sell x times" do
    result = @subj.max_profit([1,3,7,5,10,3], 3)
    expect(result).to eq(6)
  end

end
