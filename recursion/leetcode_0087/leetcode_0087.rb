# @param {String} s1
# @param {String} s2
# @return {Boolean}
def is_scramble(s1, s2)
  hash = {}
  scrambled?(s1, s2, hash)
end

def scrambled?(s1, s2, hash)
  return true if (s1 == s2)
  return hash[s1 + "-" + s2] if (hash[s1 + "-" + s2] != nil)
  length = s1.length
  rtn = false
  for i in 1..(length - 1)
    s1_left, s1_right = s1[0, i], s1[i, length - i]
    s2_left, s2_right = s2[0, i], s2[i, length - i]
    if (scrambled?(s1_left, s2_left, hash) && scrambled?(s1_right, s2_right, hash))
      rtn = true
      break
    end
    s2_left, s2_right = s2[0, length - i], s2[length - i, i]
    if (scrambled?(s1_left, s2_right, hash) && scrambled?(s1_right, s2_left, hash))
      rtn = true
      break
    end
  end
  hash[s1 + "-" + s2] = rtn
  return rtn
end
