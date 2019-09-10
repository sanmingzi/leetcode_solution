# leetcode_0044

- [Wildcard Matching](https://leetcode.com/problems/wildcard-matching/)
- [source code by Ruby](leetcode_0044.rb)

## problem description

```
Given a string (s) and a pattern (p).
'?' in p can match any single character.
'*' in p can math any string (including the empty string).
The matching should cover the entire string (s).
```

## analyze code

```ruby
if(s[si] == p[pi] || '?' == p[pi])
  # match single character
  dp[si][pi] = match(s, p, si + 1, pi + 1, dp)
elsif('*' == p[pi])
  # '*' can math any string
  for i in 0..(s.length - si)
    dp[si][pi] = match(s, p, si + i, pi + 1, dp)
    break if(dp[si][pi] == true)
  end
else
  # not match
  dp[si][pi] = false
end
```
