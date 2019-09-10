# @param {Integer[]} nums
# @return {Integer}
def first_missing_positive(nums)
  length = nums.length
  for i in 0..(length - 1)
      value = nums[i]
      while(value >= 1 && value <= length && nums[value - 1] != value)
          temp = nums[value - 1]
          nums[value - 1] = value
          value = temp
      end
  end
  for i in 0..(length - 1)
      return i + 1 if(nums[i] != i + 1)
  end
  return length + 1
end
