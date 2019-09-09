# leetcode_0037

- [Sudoku Solver](https://leetcode.com/problems/sudoku-solver/)
- [source code by Ruby](leetcode_0037.rb)

## problem description

```
This is a sudoku problem. Given a board, you should fill it.
1-9 must occur in each row / column / 3x3 grid.
```

## analyze code

```ruby
# use dfs and back tracking to solve this problem
valid_digits(board, x, y).each { |digit|
    board[x][y] = digit
    return true if(solve(board, x_next, y_next))
    board[x][y] = '.'
}
```
