# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  return 0 if(s == nil || s.empty?)
  stack_index, stack_c = [], []
  stack_index << -1
  for i in 0..(s.length - 1)
      c = s[i]
      if(c == "\)" && stack_c.last == "\(")
          stack_index.pop
          stack_c.pop
      else
          stack_index << i
          stack_c << c
      end
  end
  stack_index << s.length
  # puts stack_index.inspect
  rtn = 0
  for i in 1..(stack_index.length - 1)
      rtn = [rtn, stack_index[i] - stack_index[i - 1] - 1].max
  end
  return rtn
end
