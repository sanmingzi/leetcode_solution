# @param {Character[][]} matrix
# @return {Integer}
def maximal_rectangle(matrix)
  return 0 if (nil == matrix || matrix.empty?)

  row, column = matrix.length, matrix.first.length
  lengths = []
  for i in 0..(row - 1)
    lengths[i] = []
    lengths[i][0] = matrix[i][0].to_i
    for j in 1..(column - 1)
      lengths[i][j] = 0
      lengths[i][j] = lengths[i][j - 1] + 1 if ("1" == matrix[i][j])
    end
  end
  rtn = lengths[0].max
  for i in 1..(row - 1)
    for j in 0..(column - 1)
      k, l = i, lengths[i][j]
      while (k >= 0 && lengths[k][j] > 0)
        l = [l, lengths[k][j]].min
        temp = l * (i - k + 1)
        rtn = temp if (temp > rtn)
        k -= 1
      end
    end
  end
  return rtn
end
