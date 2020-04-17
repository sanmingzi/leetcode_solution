# @param {String} s
# @return {String}
def shortest_palindrome(s)
  return s if(nil == s || s.empty?)
  
  new_s = add_flag_to_s(s)
  p = palindromes(new_s)
  max = 0
  i = p.length - 1
  while(i >= 0)
      if(i == p[i])
          max = p[i] - 1
          prefix_s = s[max, s.length - max].reverse
          return prefix_s + s
      end
      i -= 1
  end
end

def add_flag_to_s(s)
  new_s = '$'
  s.each_char { |c| new_s += ('#' + c) }
  new_s += '#'
  new_s += '&'
  new_s
end

def palindromes(s)
  p = []
  p[0] = 1
  id = 0
  max_right = 1
  for i in 1..(s.length - 2)
      if(i < max_right)
          j = 2 * id - i
          p[i] = [p[j], max_right - i].min
      else
          p[i] = 1
      end
      while(s[i - p[i]] == s[i + p[i]])
          p[i] += 1
      end
      if(max_right < i + p[i])
          max_right = i + p[i]
          id = i
      end
  end
  return p
end
