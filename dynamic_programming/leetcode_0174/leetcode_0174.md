# leetcode_0174

- [Dungeon Game](https://leetcode.com/problems/dungeon-game/)
- [source code by Ruby](leetcode_0174.rb)

## problem description

```
There are M x N rooms in a 2D grid.
You have an initial health.
You will loses health if the number in the room is negative integer.
You will increase health if the number in the room is positive integer.
You can move only rightward / downward each step.
You should keep your health > 0 every time.
Calculate the minimum initial health that you can go to the bottom-right room from top-left room.
```

## analyze code

```ruby
# dp[current] = [dp[right], dp[down]].min - dungeon[current]
# dp[current] >= 1
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
```
