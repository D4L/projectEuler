public


# 2d array where x is the sum of a set of numbers and
# y is the largest number in that set
# the array is used to count the number
#
def zoep
  n = 100
  table = Array.new(n+1) {|i| Array.new(i+1)}
  table[0].push 1
  table[1][1] = 1
  (2..n).each do |x|
      (1..x).each do |y|
        table[x][y] = table[x-y][1..y].inject(&:+)
      end
  end
  table[n][1..n-1].inject(&:+)
end
