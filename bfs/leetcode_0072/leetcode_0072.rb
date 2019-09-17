# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
  return 0 if (word1 == word2)
  arr = [word1]
  length_word2 = word2.length
  lo, hi, step = 0, 1, 0
  rtn = word1.length + word2.length
  while (lo < hi && step < rtn)
    # puts arr.inspect
    hi_temp = hi
    step += 1
    while (lo < hi_temp)
      word = arr[lo]
      lo += 1
      length_word = word.length
      i = j = 0
      while (i < length_word && j < length_word2)
        break if (word[i] != word2[j])
        i += 1
        j += 1
      end
      if (i == length_word)
        temp = step + length_word2 - j - 1
        rtn = temp if (temp < rtn)
        next
      end
      if (j == length_word2)
        temp = step + length_word - i - 1
        rtn = temp if (temp < rtn)
        next
      end

      new_words = []
      # delete
      new_words << (word[0, i] + word[i + 1, length_word - i - 1])
      # replace
      new_words << (word[0, i] + word2[i] + word[i + 1, length_word - i - 1])
      # insert
      new_words << (word[0, i] + word2[i] + word[i, length_word - i])

      new_words.each do |new_word|
        return step if (new_word == word2)
        unless (arr.include?(new_word))
          arr << new_word
          hi += 1
        end
      end
    end
  end
  return rtn
end
