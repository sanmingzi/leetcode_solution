# @param {String} s1
# @param {String} s2
# @param {String} s3
# @return {Boolean}
def is_interleave(s1, s2, s3)
  return false if(s1.length + s2.length != s3.length)
  dp = []
  for i in 0..s1.length
      dp[i] = []
      for j in 0..s2.length
          dp[i][j] = []
      end
  end
  dp[s1.length][s2.length][s3.length] = true
  interleave(s1, s2, s3, 0, 0, 0, dp)
end

def interleave(s1, s2, s3, l1, l2, l3, dp)
  return dp[l1][l2][l3] if(dp[l1][l2][l3] != nil)
  c1, c2, c3 = nil, nil, s3[l3]
  c1 = s1[l1] if(l1 < s1.length)
  c2 = s2[l2] if(l2 < s2.length)
  rtn = false
  if(c1 == c3 && c2 == c3)
      rtn = interleave(s1, s2, s3, l1 + 1, l2, l3 + 1, dp) | interleave(s1, s2, s3, l1, l2 + 1, l3 + 1, dp)
  elsif(c1 == c3 && c2 != c3)
      rtn = interleave(s1, s2, s3, l1 + 1, l2, l3 + 1, dp)
  elsif(c1 != c3 && c2 == c3)
      rtn = interleave(s1, s2, s3, l1, l2 + 1, l3 + 1, dp)
  end
  dp[l1][l2][l3] = rtn
  return rtn
end
