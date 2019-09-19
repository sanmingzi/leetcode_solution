# leetcode_0212

- [Word Search II](https://leetcode.com/problems/word-search-ii/)
- [source code by Ruby](leetcode_0212.rb)

## problem description

Given a 2D board and a list of words, find all words in the board.  
Each word must be constructed from letters of sequentially adjacent cell.  
The same letter cell may not be used more than once in a word.

- example

```html
input:
[["a","b","c"], ["a","b","d"]]
["abcdba", "cbbd","cda"]
output:
["abcdba","cbbd"]
```

## analyze code

For searching a word, we can use every point in the board as the begin point and run the depth first search.  
But this method use more time. There some case, word1 = 'abcde', word2 = 'abcdef'. The word1 is the prefix of word2. If we search them one by one, it will search word1 two times.  
Here is a better method.  

1. prefix_counts = {}, find prefixs of all words and count its times.
2. use every point in the board as the begin point, run dfs.
3. string s is the path in dfs, if(prefix_counts[s] > 0), we think this search is useful.
4. when we find a word, fidn all prefixs of this word and their value in prefix_counts should -1.

```ruby
# find prefixs of all words
def init(words, rtns, prefix_counts)
  words.each do |word|
    rtns[word] = false
    s = ""
    word.each_char do |c|
      s += c
      prefix_counts[s] = 0 if (prefix_counts[s] == nil)
      prefix_counts[s] += 1
    end
  end
end
```

```ruby
def search(board, row, column, x, y, word, flags, prefix_counts, rtns)
  # the word in this search is not in prefix_counts
  return if (prefix_counts[word] == nil || prefix_counts[word] < 1)

  # find a word
  if (rtns[word] == false)
    rtns[word] = true
    s = ""
    word.each_char do |c|
      s += c
      prefix_counts[s] -= 1
    end
  end

  dirs = [[0, -1], [0, 1], [-1, 0], [1, 0]]
  dirs.each do |dir|
    x_next, y_next = x + dir[0], y + dir[1]
    if (x_next >= 0 && x_next < row && y_next >= 0 && y_next < column && !flags[x_next][y_next])
      flags[x][y] = true
      search(board, row, column, x_next, y_next, word + board[x_next][y_next], flags, prefix_counts, rtns)
      flags[x][y] = false
    end
  end
end
```
