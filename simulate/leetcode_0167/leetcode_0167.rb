# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  values = {}
  numbers.each_with_index { |number, index|
      key = target - number
      if(values[key] != nil)
          return [values[key] + 1, index + 1]
      end
      values[number] = index
  }
end
