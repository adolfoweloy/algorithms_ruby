class SellStocks
  def max_profit(prices)
    min_price = prices[0]
    profit = 0
    prices.each do |p|
      min_price = [min_price, p].min
      profit = [profit, p - min_price].max
    end
    profit
  end
end
