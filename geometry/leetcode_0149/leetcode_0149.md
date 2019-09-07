# leetcode_0149

- [Max Points on a Line](https://leetcode.com/problems/max-points-on-a-line/)
- [source code by Ruby](leetcode_0149.rb)

## problem description

Give n points on 2D plane, find the maximum number of points that lie on the same straight line.

Note:

1. these points maybe duplicate

## analyze code

```ruby
# count the number of same point
def count_point(points, counts)
    points.each { |point|
        counts[point] = 0 if(counts[point] == nil)
        counts[point] += 1
    }
end
```

```ruby
# calculate the key of straight line between two points
def get_key(point1, point2)
    x1, y1 = point1.first, point1.last
    x2, y2 = point2.first, point2.last
    if(x1 == x2)
        c = -1 * x1
        return [1, 0, c]
    end
    if(y1 == y2)
        c = -1 * y1
        return [0, 1, c]
    end
    tx = x1 - x2
    ty = y1 - y2
    # the gradient of the straight line maybe not integer
    # use fraction to express the gradient
    mcd = max_common_divisor(tx.abs, ty.abs)
    k1 = ty / mcd
    k2 = tx / mcd
    b = y1 - x1 * k1 / k2
    return [k1, k2, -1, b]
end

def max_common_divisor(a, b)
    return max_common_divisor(b, a) if(a < b)
    k = a / b
    c = a - b * k
    return b if(c == 0)
    max_common_divisor(b, c)
end
```
