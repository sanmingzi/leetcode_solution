# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}
def find_words(board, words)
  return [] if (board == nil || board.empty?)

  rtns, prefix_counts = {}, {}
  init(words, rtns, prefix_counts)
  row, column = board.length, board[0].length
  flags = Array.new(row) { Array.new(column, false) }

  for i in 0..(row - 1)
    for j in 0..(column - 1)
      search(board, row, column, i, j, board[i][j], flags, prefix_counts, rtns)
    end
  end

  words.select do |word|
    rtns[word]
  end
end

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

def search(board, row, column, x, y, word, flags, prefix_counts, rtns)
  return if (prefix_counts[word] == nil || prefix_counts[word] < 1)

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
