# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  p = init_p(p)
  dp = []
  for i in 0..(s.length - 1)
      dp[i] = []
  end
  match(s, p, 0, 0, dp)
end

def match(s, p, si, pi, dp)
  # si == s.length
  if(si == s.length)
      return true if(pi == p.length)
      return true if(pi == p.length - 1 && '*' == p[pi])
      return false
  end
  
  # si < s.length
  return false if(pi == p.length)
  
  # pi < p.length
  return dp[si][pi] if(nil != dp[si][pi])
  
  if(s[si] == p[pi] || '?' == p[pi])
      dp[si][pi] = match(s, p, si + 1, pi + 1, dp)
  elsif('*' == p[pi])
      for i in 0..(s.length - si)
          dp[si][pi] = match(s, p, si + i, pi + 1, dp)
          break if(dp[si][pi] == true)
      end
  else
      dp[si][pi] = false
  end
  return dp[si][pi]
end

def init_p(p)
  return p if(p.empty?)
  count = 0
  for i in 0..(p.length - 1)
      break if('*' != p[i])
      count += 1
  end
  return '*' if(count == p.length)
  p = p[count - 1, p.length - count + 1] if(count > 1)
  
  i, count = p.length - 1, 0
  while(i >= 0)
      break if('*' != p[i])
      count += 1
      i -= 1
  end
  p[0, p.length - count + 1]
end
