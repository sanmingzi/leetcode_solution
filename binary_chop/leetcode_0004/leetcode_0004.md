# leetcode_0004

- [Median of Two Sorted Arrays](https://leetcode.com/problems/median-of-two-sorted-arrays/)
- [source code by Ruby](leetcode_0004.rb)

## problem description

Find the median in two sorted nums.

## analyze code

```ruby
# Compare the a[k/2] and b[k/2]
# If a[k/2] < b[k/2], then cut first k/2 number of array a, found (k - k/2)th number in the left array a and array b
# It is similar when b[k/2] < a[k/2]

def find_kth(nums1, i1, nums2, i2, k)
  return nums2[i2 + k - 1] if(i1 >= nums1.size)
  return nums1[i1 + k - 1] if(i2 >= nums2.size)
  return [nums1[i1], nums2[i2]].min if(k == 1)

  key = k / 2
  key1 = (i1 + key - 1 >= nums1.size) ? 999999999 : nums1[i1 + key - 1]
  key2 = (i2 + key - 1 >= nums2.size) ? 999999999 : nums2[i2 + key - 1]
  if(key1 < key2)
    find_kth(nums1, i1 + key, nums2, i2, k - key)
  else
    find_kth(nums1, i1, nums2, i2 + key, k - key)
  end
end
```
