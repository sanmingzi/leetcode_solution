# leetcode_0176

- [Factorial Trailing Zeroes](https://leetcode.com/problems/factorial-trailing-zeroes/)
- [source code by Ruby](leetcode_0172.rb)

## problem description

Return the number of trailing zeroes in n!

## analyze code

```ruby
# find how many numbers can divided by 5 / 5*5 / 5*5*5
d, counts = 5, []
while(true)
    v = n / d
    break if(v == 0)
    counts << v
    d *= 5
end
```

```ruby
# if the number can divided by 5, this number can make one trailing zero
# can devided by 5*5, this number can make two trailing zero
for i in 0..(counts.length - 2)
    rtn = rtn + (counts[i] - counts[i + 1]) * (i + 1)
end
```
