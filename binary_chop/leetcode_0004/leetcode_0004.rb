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

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  length1 = nums1.size
  length2 = nums2.size
  length = length1 + length2
  if(length & 1 == 1)
    return find_kth(nums1, 0, nums2, 0, length / 2 + 1)
  else
    # puts find_kth(nums1, 0, nums2, 0, length / 2)
    # puts find_kth(nums1, 0, nums2, 0, length / 2 + 1)
    return (find_kth(nums1, 0, nums2, 0, length / 2) + find_kth(nums1, 0, nums2, 0, length / 2 + 1)) * 0.5
  end
end

# puts find_median_sorted_arrays([0, 1, 2, 3], [0, 1, 6, 7])
# puts find_median_sorted_arrays([0, 1, 2, 3], [0, 1, 6, 7, 8])
