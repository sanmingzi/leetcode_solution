# leetcode_0042

- [Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water/)
- [source code by Ruby](leetcode_0042.rb)

## problem description

Given n non-negative integers representing an elevation map, compute how much water it is able to trap after raining.

## analyze code

```ruby
# if the height[i] is highest in height[0]..height[i], target_index = heightest[i - 1]
# if the height[i] is not highest in height[0]..height[i], target_index = higher_index(height, i)
# dp[i] = dp[target_index] + ([heigth[i], height[target_index]].min - height[j]), (target_index < j < i)
for i in 2..(length - 1)
    target_index = heightest[i]
    if(height[target_index] == height[i])
        target_index = heightest[i - 1]
    else
        target_index = higher_index(height, i)
    end
    dp[i] = dp[target_index]
    min = [height[target_index], height[i]].min
    for j in (target_index + 1)..(i - 1)
        dp[i] += (min - height[j])
    end
end

def higher_index(height, i)
  h = height[i]
  while(i >= 0)
      return i if(height[i] > h)
      i -= 1
  end
  return -1
end
```
