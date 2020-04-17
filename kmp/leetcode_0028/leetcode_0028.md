# leetcode_0028

- [Implement strStr()](https://leetcode.com/problems/implement-strstr/)
- [source code by Ruby](leetcode_0028.rb)

## problem description

Given two string needle and haystack, return the index of the fist occurrence of needle in haystack, otherwise return -1.

## analyze code

This is a searching sub-string problem. Use the KMP algorithm to solve it.  
The key of this solution is generating the DFA(deterministic finite automaton) of the string needle.

```ruby
# needle[0..x] == needle[(i - x)..i]
# the init state is 0, the last state is needle.length
# for init state 0
# if the input char is needle[0], then state = 1, dfa[0][needle[0]] = 0 + 1
# it is easy to know, dfa[i][needle[i]] = i + 1
# if the input char is not needle[i]
# the next state x = dfa[x][needle[i]]

def generate_dfa(needle)
  length = needle.length
  r, x = 128, 0
  dfa = Array.new(length + 1) { Array.new(r, 0) }
  dfa[0][needle[0].ord] = 1
  for i in 1..(length - 1)
    for j in 0..(r - 1)
      dfa[i][j] = dfa[x][j]
    end
    dfa[i][needle[i].ord] = i + 1
    x = dfa[x][needle[i].ord]
  end
  return dfa
end
```

```ruby
def str_str(haystack, needle)
  return 0 if (haystack == needle || needle.empty?)
  return -1 if (haystack.empty?)
  dfa = generate_dfa(needle)
  m, n, x = haystack.length, needle.length, 0
  for i in 0..(m - 1)
    x = dfa[x][haystack[i].ord]
    return i - n + 1 if (x == n)
  end
  return -1
end
```
