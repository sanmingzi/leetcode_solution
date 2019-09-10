# leetcode_0041

- [First Missing Positive](https://leetcode.com/problems/first-missing-positive/)
- [source code by Ruby](leetcode_0041.rb)

## problem description

Given an unsorted integer array, find the smallest missing positive integer.

- Example

```
input: [-1, 0, 1, 2]
output: 3
```

```
input: [-1,-1,1,1,2,3,4,5]
output: 6
```

## analyze code

```ruby
# for every value in the array
# if(value >= 1 && value <= array.length), then nums[value - 1] = value
for i in 0..(length - 1)
      value = nums[i]
      while(value >= 1 && value <= length && nums[value - 1] != value)
          temp = nums[value - 1]
          nums[value - 1] = value
          value = temp
      end
  end
```
