# leetcode_0003

- [Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)
- [source code by ruby](leetcode_0003.rb)

## problem desciption

Find the longest substring without repeating characters.

## analyze code

```ruby
# cursor = [] => remember the last index of character
# dp = [] => the longest substring without repeating character, ending by the i-th character

value = s[i].ord
before_cursor = cursor[value]
cursor[value] = i
if before_cursor == nil
    dp[i] = dp[i - 1] + 1
elsif before_cursor < i - dp[i-1]
    dp[i] = dp[i - 1] + 1
else
    dp[i] = i - before_cursor
end
rtn = dp[i] if dp[i] > rtn
```
