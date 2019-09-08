# @param {Integer[][]} dungeon
# @return {Integer}
def calculate_minimum_hp(dungeon)
  return 0 if(dungeon == nil || dungeon.empty?)
  dp = []
  row, column = dungeon.length, dungeon.first.length
  x = row - 1
  while(x >= 0)
      dp[x] = []
      y = column - 1
      while(y >= 0)
          health, v = 1, dungeon[x][y]
          health += -1 * v if(dungeon[x][y] < 0)
          temps = []
          [[0, 1], [1, 0]].each { |dir|
              x1, y1 = x + dir[0], y + dir[1]
              temps << dp[x1][y1] if(x1 < row && y1 < column)
          }
          unless(temps.empty?)
              temp = temps.min
              health = temp - v
              health = 1 if(health <= 0)
          end
          dp[x][y] = health
          y -= 1
      end
      x -= 1
  end
  # puts dp.inspect
  return dp[0][0]
end
