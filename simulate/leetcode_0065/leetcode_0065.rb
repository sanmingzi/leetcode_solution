# @param {String} s
# @return {Boolean}
def is_number(s)
  return false if(s.empty?)
  s.strip!
  return false if(s.empty?)
  s = s[1, s.length - 1] if(s[0] == '+' || s[0] == '-')
  return false if(s.empty?)
  return is_exponent?(s) if(s.include?('e'))
  return is_decimal?(s)  if(s.include?('.'))
  return is_non_sign_integer?(s)
end

def is_exponent?(s)
  index_e = s.rindex('e')
  return false if(nil == index_e)
  sub1 = s[0, index_e]
  sub2 = s[index_e + 1, s.length - index_e - 1]
  if(!sub2.empty? && (sub2[0] == '+' || sub2[0] == '-'))
      sub2 = sub2[1, sub2.length - 1]
  end
  return false if(sub1.empty? || sub2.empty?)
  return (is_decimal?(sub1) || is_non_sign_integer?(sub1)) && is_non_sign_integer?(sub2)
end

def is_decimal?(s)
  index_p = s.rindex('.')
  return false if(nil == index_p)
  sub1 = s[0, index_p]
  sub2 = s[index_p + 1, s.length - index_p - 1]
  return false if(sub1.empty? && sub2.empty?)
  return false if(!sub1.empty? && !is_non_sign_integer?(sub1))
  return false if(!sub2.empty? && !is_non_sign_integer?(sub2))
  return true
end

def is_non_sign_integer?(s)
  return false if(s.empty?)
  s.each_char { |c| return false if(c < '0' || c > '9') }
  return true
end
