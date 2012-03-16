public

def oacz
  squaredSum = 0
  normalSum = 0
  (1..25).each do |i|
    squaredSum += i ** 2 + (i + 25) ** 2 + (i + 50) ** 2 + (i + 75) ** 2
    normalSum += i + (i + 25) + (i + 50) + (i + 75)
  end
  normalSum ** 2 - squaredSum
end
