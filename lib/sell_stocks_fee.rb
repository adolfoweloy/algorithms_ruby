class SellStocksFee
  def max_profit(prices, fee)
    n = prices.size
    hold = [-prices[0]]
    free = [0]
    for i in 1...n
      free[i] = [free[i-1], hold[i-1] + prices[i] - fee].max
      hold[i] = [hold[i-1], free[i-1] - prices[i]].max
    end
    free[n-1]
  end
end
