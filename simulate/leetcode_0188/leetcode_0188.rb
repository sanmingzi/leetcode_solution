# @param {Integer} k
# @param {Integer[]} prices
# @return {Integer}
def max_profit(k, prices)
  prices = simple_prices(prices)
  while (true)
    # puts prices.inspect
    break if (k * 2 >= prices.length)
    delete_prices(prices)
  end
  cal_profits(prices)
end

def delete_prices(prices)
  min_id, min, length = 0, prices[1] - prices[0], prices.length
  for i in 1..(length - 2)
    v = (prices[i] - prices[i + 1]).abs
    if (v < min)
      min = v
      min_id = i
    end
  end
  prices.slice!(min_id, 2)
end

def simple_prices(prices)
  new_prices = []
  i, length = 1, prices.length
  while (i < length)
    while (i < length && prices[i] <= prices[i - 1])
      i += 1
    end
    new_prices << prices[i - 1] if (i < length)
    while (i < length && prices[i] >= prices[i - 1])
      i += 1
    end
    new_prices << prices[i - 1] if (i < length)
  end
  if (new_prices.length % 2 == 1)
    new_prices << prices.last
  end
  return new_prices
end

def cal_profits(prices)
  i, length, profit = 0, prices.length, 0
  while (i < length)
    profit += (prices[i + 1] - prices[i])
    i += 2
  end
  return profit
end

# 174
# prices = [70, 4, 83, 56, 94, 72, 78, 43, 2, 86, 65]
# k = 2
# puts max_profit(k, prices)
