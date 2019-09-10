# leetcode_0045

- [Jump Game II](https://leetcode.com/problems/jump-game-ii/)
- [source code by Ruby](leetcode_0045.rb)

## problem description

```
an array of non-negative integers.
initialize position is 0.
your maximum jump length = nums[current_position]
compute the minimum number of jumps reach the last index.
```

## analyze code

```ruby
# if(num + index >= nums.length - 1), return count + 1
# if(!arr.include?(index_next)), arr.push(index_next)
while(lo < hi)
    hi_temp = hi
    while(lo < hi_temp)
        index = arr[lo]
        num = nums[index]
        return count + 1 if(num + index >= target)
        step = num
        # note this, the step should be decrease
        while(step >= 1)
            index_next = index + step
            unless(arr.include?(index_next))
                arr << index_next
                hi += 1
            end
            step -= 1
        end
        lo += 1
    end
    count += 1
end
```
