# leetcode_0188

- [Best Time to Buy and Sell Stock IV](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iv/)
- [source code by Ruby](leetcode_0188.rb)

## problem description

Given an array of prices in each day.  
You can do k transactions, calculate the maximum profit.

## analyze code

- simple prices

Many prices is unuseful, [1, 2, 3, 4] => [1, 4], just find all couple of  peak value and valley value, [1, 2, 3, 4, 0, 5] => [1, 4, 0, 5]

- delete couple points which has the smallest D-value

If k * 2 >= prices.length, we can do all transactions, the profit is maximum.  
If k * 2 < prices.length, we should delete the couple points which hash the smallest D-value until k * 2 >= prices.length.  
Prove it:  
k transactions:  
profit1 = (y1 + y2 + ... + y<sub>k</sub>) - (x1 + x2 + ... + x<sub>k</sub>)  
(k - 1) transactions:  
profit2 = (y1 + y2 + ... + y<sub>n</sub>) - (x1 + x2 + ... + x<sub>n</sub>)  
profit1 - profit2 = y<sub>k</sub> - x<sub>k $\pm$ 1</sub>  

```ruby
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
```
