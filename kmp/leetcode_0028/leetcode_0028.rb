# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  return 0 if (haystack == needle || needle.empty?)
  return -1 if (haystack.empty?)
  dfa = generate_dfa(needle)
  m, n, x = haystack.length, needle.length, 0
  for i in 0..(m - 1)
    x = dfa[x][haystack[i].ord]
    return i - n + 1 if (x == n)
  end
  return -1
end

def generate_dfa(needle)
  length = needle.length
  r, x = 128, 0
  dfa = Array.new(length + 1) { Array.new(r, 0) }
  dfa[0][needle[0].ord] = 1
  for i in 1..(length - 1)
    for j in 0..(r - 1)
      dfa[i][j] = dfa[x][j]
    end
    dfa[i][needle[i].ord] = i + 1
    x = dfa[x][needle[i].ord]
  end
  return dfa
end
