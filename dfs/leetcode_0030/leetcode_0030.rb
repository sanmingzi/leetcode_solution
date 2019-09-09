# @param {String} s
# @param {String[]} words
# @return {Integer[]}
def find_substring(s, words)
  return [] if(s == nil || s.empty? || words == nil || words.empty?)
  word_hash, word_count, count = {}, {}, words.count
  init(words, word_hash, word_count)
  words_length = words_length(words)
  # puts word_hash.inspect
  # puts word_count.inspect
  # puts words_length
  rtns = []
  for i in 0..(s.length - words_length)
      rtns << i if(is_valid?(s[i, words_length], word_hash, word_count))
  end
  return rtns
end

def init(words, word_hash, word_count)
  words.each { |word|
      word_count[word] = 0 if(word_count[word] == nil)
      word_count[word] += 1
      key = word[0]
      if(word_hash[key] == nil)
          word_hash[key] = []
          word_hash[key] << word
          next
      end
      word_hash[key] << word unless(word_hash[key].include?(word))
  }
end

def words_length(words)
  rtn = 0
  words.each { |word| rtn += word.length }
  return rtn
end

def is_valid?(s, word_hash, word_count)
  s_length = s.length
  key = s[0]
  return false if(word_hash[key] == nil)
  word_hash[key].each { |word|
      w_length = word.length
      next if(word_count[word] <= 0)
      if(word == s[0, w_length])
          return true if(s_length == w_length)
          word_count[word] -= 1
          if(is_valid?(s[w_length, s_length - w_length], word_hash, word_count))
              word_count[word] += 1
              return true
          end
          word_count[word] += 1
      end
  }
  return false
end
