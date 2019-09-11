# leetcode_0076

- [Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/)
- [source code by Ruby](leetcode_0076.rb)

## problem description

Given a string S and a string T, find the minimum window in S which will contain all the characters in T.

- Example

```
input:
"a"
"aa"

output:
""
```

```
input:
"abceeeeedddc"
"abcc"

output:
"abceeeeedddc"
```

## analyze code

```ruby
# count: how many different char in T
# hash: the number of any char in T
count, hash = 0, {}
t.each_char do |c|
    if(nil == hash[c])
        hash[c] = 0
        count += 1
    end
    hash[c] += 1
end
```

```ruby
# set [lo, hi) as the border of the window

# count = 0, means all chars in T is included in window
# hash[c] <= 0, means all of the char c in T is included in window 

# if(count > 0), there are some chars in string T but not in the window
# expand the window, hash[hi] -= 1, hi += 1

# if(count == 0), all chars in T are in the window
# contract the window, hash[lo] += 1, lo += 1

min, rtn = s.length + 1, ''
lo, hi = 0, 0
while(true)
  if(count > 0)
    break if(hi >= s.length)
    c = s[hi]
    hi += 1
    if(hash[c] != nil)
      hash[c] -= 1
      count -= 1 if(hash[c] == 0)
    end
  else
    if(hi - lo < min)
      min = hi - lo
      rtn = s[lo, min]
    end
    c = s[lo]
    lo += 1
    if(hash[c] != nil)
      hash[c] += 1
      count += 1 if(hash[c] == 1)
    end
  end
end
```
