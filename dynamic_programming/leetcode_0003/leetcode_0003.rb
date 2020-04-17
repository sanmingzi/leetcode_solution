# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  length = s.length
  return length if length <= 1

  cursor = []
  dp = []
  rtn = dp[0] = 1
  cursor[s[0].ord] = 0
  for i in 1..(length - 1)
      value = s[i].ord
      before_cursor = cursor[value]
      cursor[value] = i
      if before_cursor == nil
          dp[i] = dp[i - 1] + 1
      elsif before_cursor < i - dp[i-1]
          dp[i] = dp[i - 1] + 1
      else
          dp[i] = i - before_cursor
      end
      rtn = dp[i] if dp[i] > rtn
  end
  rtn
end
