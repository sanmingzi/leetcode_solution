# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  value_index = {}
  nums.each_with_index do |value, i|
    key = target - value
    return [value_index[key], i] if value_index[key]
    value_index[value] = i
  end
end
