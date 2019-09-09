# leetcode_0032

- [Longest Valid Parentheses](https://leetcode.com/problems/longest-valid-parentheses/)
- [source code by Ruby](leetcode_0032.rb)

## problem description

Given a string only contain "(" and ")", find the longest valid parentheses substring.

## analyze code

```ruby
# the stack_index save the index
# the stack_c save the character
# stack_index/stack_c pop when the top two character is ()
# length = stack_index[i] - stack_index[i - 1] - 1
stack_index, stack_c = [], []
stack_index << -1
for i in 0..(s.length - 1)
    c = s[i]
    if(c == "\)" && stack_c.last == "\(")
        stack_index.pop
        stack_c.pop
    else
        stack_index << i
        stack_c << c
    end
end
```
