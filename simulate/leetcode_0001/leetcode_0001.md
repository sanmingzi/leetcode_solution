# leetcode_0001

- [Two Sum](https://leetcode.com/problems/two-sum/)
- [source code by ruby](leetcode_0001.rb)

## problem desciption

Find two indexs of two values which sum to the target.

## analyze code

```ruby
# value_index = {} => remember the index of the value

value_index = {}
nums.each_with_index do |value, i|
  key = target - value
  return [value_index[key], i] if value_index[key]
  value_index[value] = i
end
```
