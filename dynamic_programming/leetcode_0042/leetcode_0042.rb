# @param {Integer[]} height
# @return {Integer}
def trap(height)
  return 0 if(nil == height || height.length < 3)
  heightest, length = [], height.length
  heightest[0] = 0
  for i in 1..(length - 1)
      heightest[i] = heightest[i - 1]
      heightest[i] = i if(height[i] > height[heightest[i]])
  end
  
  dp = []
  dp[0], dp[1] = 0, 0
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
  return dp[length - 1]
end

def higher_index(height, i)
  h = height[i]
  while(i >= 0)
      return i if(height[i] > h)
      i -= 1
  end
  return -1
end
