public

def oakc
  squaredSum = 0
  normalSum = 0
  (1..100).each do |i|
    squaredSum += i ** 2
    normalSum += i
  end
  normalSum ** 2 - squaredSum
end
