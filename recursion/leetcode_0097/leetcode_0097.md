# leetcode_0097

- [Interleaving String](https://leetcode.com/problems/interleaving-string/)
- [source code by Ruby](leetcode_0097.rb)

## problem description

Given s1, s2, s3, find whether s3 is formed by the interleaving of s1 and s2.

## analyze code

```ruby
# dp[s1.length][s2.length][s3.length] = true
# dp[l1][l2][l3] = dp[l1 + 1][l2][l3 + 1] | dp[l1][l2 + 1][l3 + 1]

def interleave(s1, s2, s3, l1, l2, l3, dp)
  return dp[l1][l2][l3] if(dp[l1][l2][l3] != nil)
  c1, c2, c3 = nil, nil, s3[l3]
  c1 = s1[l1] if(l1 < s1.length)
  c2 = s2[l2] if(l2 < s2.length)
  rtn = false
  if(c1 == c3 && c2 == c3)
      rtn = interleave(s1, s2, s3, l1 + 1, l2, l3 + 1, dp) | interleave(s1, s2, s3, l1, l2 + 1, l3 + 1, dp)
  elsif(c1 == c3 && c2 != c3)
      rtn = interleave(s1, s2, s3, l1 + 1, l2, l3 + 1, dp)
  elsif(c1 != c3 && c2 == c3)
      rtn = interleave(s1, s2, s3, l1, l2 + 1, l3 + 1, dp)
  end
  dp[l1][l2][l3] = rtn
  return rtn
end
```
