public

def ejtl
  result = 0
  grid = Array.new
  File.open("src/problem-11/grid").each do |line|
     grid.push line.strip.split(" ").map{|i| i.to_i}
  end
  (0..19).each do |i|
    (0..15).each do |k|
      bar = grid[i][k]*grid[i][k+1]*grid[i][k+2]*grid[i][k+3]
      result = bar if bar > result
      bar = grid[k][i]*grid[k+1][i]*grid[k+2][i]*grid[k+3][i]
      result = bar if bar > result
    end
  end
  (0..15).each do |i|
    (0..15).each do |k|
      bar = grid[i][k]*grid[i+1][k+1]*grid[i+2][k+2]*grid[i+3][k+3]
      result = bar if bar > result
      bar = grid[i+3][k]*grid[i+2][k+1]*grid[i+1][k+2]*grid[i][k+3]
      result = bar if bar > result
    end
  end
  result
end
