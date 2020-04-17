# @param {String[]} words
# @param {Integer} max_width
# @return {String[]}
def full_justify(words, max_width)
  rtns = []
  arr_strs, length_strs = [], 0
  for i in 0..(words.length - 1)
      word = words[i]
      total_length = length_strs + word.length + arr_strs.length
      if(total_length < max_width)
          arr_strs << word
          length_strs += word.length
      elsif(total_length == max_width)
          arr_strs << word
          rtn = ""
          arr_strs.each { |word| rtn += (word + ' ') }
          rtns << rtn.strip
          arr_strs = []
          length_strs = 0
      else
          rtns << justify(arr_strs, length_strs, max_width)
          arr_strs = [word]
          length_strs = word.length
      end
  end
  rtns << justify_last_line(arr_strs, max_width) unless(arr_strs.empty?)
  return rtns
end

def justify(arr_strs, length_strs, max_width)
  if(arr_strs.length == 1)
      rtn = arr_strs.first
      (max_width - length_strs).times { rtn += ' ' }
      return rtn
  end
  count_space = max_width - length_strs
  count_each_slot = count_space / (arr_strs.length - 1)
  str_each_slot = ''
  count_each_slot.times { str_each_slot += ' ' }
  count_left_space = count_space - count_each_slot * (arr_strs.length - 1)
  rtn = ''
  for i in 0..(arr_strs.length - 1)
      rtn += arr_strs[i]
      rtn += str_each_slot
      rtn += ' ' if(i <= count_left_space - 1)
  end
  return rtn.strip
end

def justify_last_line(arr_strs, max_width)
  rtn = ''
  arr_strs.each { |word| rtn += (word + ' ') }
  rtn.strip!
  (max_width - rtn.length).times { rtn += ' ' }
  return rtn
end
