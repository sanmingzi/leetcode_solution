# leetcode_0030

- [Substring with Concatenation of All Words](https://leetcode.com/problems/substring-with-concatenation-of-all-words/)
- [source code by Ruby](leetcode_0030.rb)

## problem description

```
Given a string s and a list of words.
Find all starting index of substring(s), that is connected by each word of words exactly once.
```

Note:

1. the list of words may have same word.
2. each word should be used exactly once.

## analyze code

```ruby
# the key of word_hash is the first character of word in the list of words
# words = ['aa', 'ab'], word_hash = {'a' => ['aa', 'ab']}
# the key of word_count is the word in the list of words
# it means the used time of each word
# words = ['aa', 'aa'], word_count = {'aa' => 2}
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
```

```ruby
# judge the string s can be connected by the left words
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
```
