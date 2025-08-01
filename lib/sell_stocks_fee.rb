class SellStocksFee
  def max_profit(prices, fee)
    profit = 0
    min_price = prices[0] + fee

    prices.each do |p|
      if p + fee < min_price
        min_price = p + fee
      elsif p > min_price
        profit += p - min_price
        min_price = p
      end
    end
    profit
  end

end
