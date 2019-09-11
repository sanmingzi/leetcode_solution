# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  return '' if('' == s || '' == t)
  
  count, hash = 0, {}
  t.each_char do |c|
      if(nil == hash[c])
          hash[c] = 0
          count += 1
      end
      hash[c] += 1
  end
  
  min, rtn = s.length + 1, ''
  lo, hi = 0, 0
  while(true)
      if(count > 0)
          break if(hi >= s.length)
          c = s[hi]
          hi += 1
          if(hash[c] != nil)
              hash[c] -= 1
              count -= 1 if(hash[c] == 0)
          end
      else
          if(hi - lo < min)
              min = hi - lo
              rtn = s[lo, min]
          end
          c = s[lo]
          lo += 1
          if(hash[c] != nil)
              hash[c] += 1
              count += 1 if(hash[c] == 1)
          end
      end
  end
  return rtn
end
