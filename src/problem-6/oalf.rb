public

def oalf
  squaredSum = Array.new(101) {|i| i**2}
  squaredSum = squaredSum.inject(&:+)
  normalSum = (1..100).inject(&:+)
  normalSum ** 2 - squaredSum
end
