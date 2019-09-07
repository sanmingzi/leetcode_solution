# @param {Integer[][]} points
# @return {Integer}
def max_points(points)
    if(points == nil || points.empty?)
        return 0
    end
    
    counts = {}
    count_point(points, counts)
    points.uniq!
    
    length, nums = points.length, {}
    for i in 0..(length - 1)
        for j in (i + 1)..(length - 1)
            key = get_key(points[i], points[j])
            nums[key] = [] if(nums[key] == nil)
            nums[key] << points[i]
            nums[key] << points[j]
        end
    end
    
    rtn = counts.values.max
    nums.values.each { |arr|
        arr.uniq!
        sum = 0
        arr.each { |point| sum += counts[point] }
        rtn = sum if(sum > rtn)
    }
    return rtn
end

def count_point(points, counts)
    points.each { |point|
        counts[point] = 0 if(counts[point] == nil)
        counts[point] += 1
    }
end

# ax + by + c = 0
# [a, b, c]
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
    mcd = max_common_divisor(tx.abs, ty.abs)
    k1 = ty / mcd
    k2 = tx / mcd
    b = y1 - x1 * k1 / k2
    return [k1, k2, -1, b]
end

# a > 0, b > 0
def max_common_divisor(a, b)
    return max_common_divisor(b, a) if(a < b)
    k = a / b
    c = a - b * k
    return b if(c == 0)
    max_common_divisor(b, c)
end
