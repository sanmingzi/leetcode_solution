# leetcode_0214

- [Shortest Palindrome](https://leetcode.com/problems/shortest-palindrome/)
- [source code by Ruby](leetcode_0214.rb)

## problem description

Given a string s, convert it to a palindrome string by add characters in front of it. Return the shortest palindrome string you can find.

- example

```markdown
input: aabbb
output: bbbaabbb
```

```markdown
input: abba
output: abba
```

## analyze code

First, We should find the longest palindrome string which is started by the first character in string s.  
Second, we add the left character in front of the string s.

```ruby
# we add some special charcater into string s.
# a  => $#a#&
# aa => $#a#a#&

def add_flag_to_s(s)
  new_s = '$'
  s.each_char { |c| new_s += ('#' + c) }
  new_s += '#'
  new_s += '&'
  new_s
end
```

```ruby
# calculate the array p of the new string
# i, the middle of palindrome string
# i_left, the left of palindrome string
# i_right, the right of palindrome string
# p[i] = i_right - i = i_left - i
# string:  $ # a # b # &
# i:       0 1 2 3 4 5 6
# i_right: 1 2 4 4 6 6 7
# p[i]:    1 1 2 1 2 1 1

# when we calculate p[i]
# p[j] is calculated, 0 <= j < i
# max_right is the max right of all palindrome string
# id is middle of that max_right

# if i < max_right
# we can find the mirror point j of point i, j = id * 2 - 1
# p[i] = [p[j], max_right - i].min

def palindromes(s)
  p = []
  p[0] = 1
  id = 0
  max_right = 1
  for i in 1..(s.length - 2)
      if(i < max_right)
          j = 2 * id - i
          p[i] = [p[j], max_right - i].min
      else
          p[i] = 1
      end
      while(s[i - p[i]] == s[i + p[i]])
          p[i] += 1
      end
      if(max_right < i + p[i])
          max_right = i + p[i]
          id = i
      end
  end
  return p
end
```
