public

def prob
  result = 2
  a = 1
  while a >= (15499.0/94744)
    result += 2
    p result
    temp = 0
    arrPrimeFactors2(result).uniq.each do |i|
      p (result / i - 1)
      temp += (result / i) - 1
    end
    a = 1 - temp/(result-1.0)
    p a
  end
  result
end
