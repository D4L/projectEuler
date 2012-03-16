public

def oacl
  squaredSum = 0
  normalSum = 0
  (1..50).each do |i|
    squaredSum += i ** 2 + (101 - i) ** 2
    normalSum += i + (101 - i)
  end
  normalSum ** 2 - squaredSum
end
