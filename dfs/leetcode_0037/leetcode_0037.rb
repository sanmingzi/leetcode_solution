# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_sudoku(board)
  solve(board, 0, 0)
  return
end

def solve(board, x, y)
  return true if(9 == x && 0 == y)
  x_next, y_next = next_point(x, y)
  return solve(board, x_next, y_next) if(board[x][y] != '.')
  valid_digits(board, x, y).each { |digit|
      board[x][y] = digit
      return true if(solve(board, x_next, y_next))
      board[x][y] = '.'
  }
  return false
end

def next_point(x, y)
  y += 1
  if(y >= 9)
      y %= 9
      x += 1
  end
  return x, y
end

def valid_digits(board, x, y)
  digits = []
  for i in 1..9
      digits << "#{i}"
  end
  for i in 0..8
      digits.delete(board[x][i])
      digits.delete(board[i][y])
  end
  i_begin = x / 3 * 3
  j_begin = y / 3 * 3
  i_end = i_begin + 2
  j_end = j_begin + 2
  for i in i_begin..i_end
      for j in j_begin..j_end
          digits.delete(board[i][j])
      end
  end
  return digits
end
