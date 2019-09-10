# @param {Integer[]} nums
# @return {Integer}
def jump(nums)
  return 0 if(nums == nil || nums.length < 2)
  
  arr, lo, hi = [0], 0, 1
  count, target = 0, nums.length - 1
  while(lo < hi)
      hi_temp = hi
      while(lo < hi_temp)
          index = arr[lo]
          num = nums[index]
          return count + 1 if(num + index >= target)
          step = num
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
  
  return count
end
