# leetcode_0072

- [Edit Distance](https://leetcode.com/problems/edit-distance/)
- [source code by Ruby](leetcode_0072.rb)

## problem description

Given two word word1 and word2, find the minimum number of operations required convert word1 to word2.  
3 operations are permitted:

1. insert a character
2. delete a character
3. replace a character

## analyze code

Find the minimum steps, we can use BFS to solve it.

```ruby
# for every word in queue
# we find the index of the first different character from front to end
# we can delete/replace/insert a same character in the index

while (lo < hi && step < rtn)
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
```
