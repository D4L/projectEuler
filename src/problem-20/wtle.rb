public

def wtle
  result = 1
  (1..100).each do |i|
    result *= i
  end
  intSumOfDigitsInt(result)
end
