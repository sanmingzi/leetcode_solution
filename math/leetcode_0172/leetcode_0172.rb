# @param {Integer} n
# @return {Integer}
def trailing_zeroes(n)
  d, counts = 5, []
  while(true)
      v = n / d
      break if(v == 0)
      counts << v
      d *= 5
  end
  return 0 if(counts.empty?)
  length = counts.length
  rtn = length * counts.last
  for i in 0..(counts.length - 2)
      rtn = rtn + (counts[i] - counts[i + 1]) * (i + 1)
  end
  return rtn
end
