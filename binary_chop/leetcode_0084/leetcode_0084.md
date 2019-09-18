# leetcode_0084

- [Largest Rectangle in Histogram](https://leetcode.com/problems/largest-rectangle-in-histogram/)
- [source code by Ruby](leetcode_0084.rb)

## problem description

Given an integer array representing the histogram's bar height where the width of each bar is 1.  
Find the largest rectangle in the histogram.

- example

```markdown
input: [1, 2, 3, 4, 5]
output: 9
```

```markdown
input: [1, 2, 2, 5, 6, 1]
output: 10
```

## analyze code

1. sort indexs by heights, traversal the array of heights, get a new array [[h1, [id1, id2]], [h2, [id3, id4]]...]
2. upkeep an array smaller_indexs, it save the indexs of smaller heights, initial value [-1, heights.length]
3. for each height and its indexs [id1, id2 ...], for example id1, find its neighbours (id_left, id_right) in smaller_indexs
4. the area of id1 is: (id_right - id_left - 1) * heights[id1]
5. insert id1 to the array smaller_indexs

```ruby
# sort indexs by heights
indexs = {}
heights.each_with_index do |h, index|
  indexs[h] = [] if (nil == indexs[h])
  indexs[h] << index
end
indexs = indexs.sort
```

```ruby
# find the first ele > target in arr
def binary_search(arr, target)
  lo, hi = 0, arr.length - 1
  while (lo < hi)
    mid = lo + (hi - lo) / 2
    if (arr[mid] <= target)
      lo = mid + 1
    else
      hi = mid
    end
  end
  return lo, arr[lo]
end
```

```ruby
# find the id_right/id_left in smaller_indexs
# insert id into smaller_indexs
indexs.each do |arr|
  h, ids = arr.first, arr.last
  small_id, id_right = -1, -1
  ids.each do |id|
    if (id > id_right)
      small_id, id_right = binary_search(small_indexs, id)
      id_left = small_indexs[small_id - 1]
      area = (id_right - id_left - 1) * h
      rtn = area > rtn ? area : rtn
    end
    small_indexs.insert(small_id, id)
    small_id += 1
  end
end
```
