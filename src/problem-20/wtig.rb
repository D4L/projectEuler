public

def wtig
  result = 1
  (1..100).each do |i|
    result *= i
  end
  intSumOfDigitsInt2(result)
end
