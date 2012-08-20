public

# this doesn't work :(
def prob
  return 0
  result = 2
  a = 1
  while a >= (15499.0/94744)
    result += 2
    temp = 0
    arrPrimeFactors2(result).uniq.each do |i|
      temp += (result / i) - 1
    end
    a = 1 - temp/(result-1.0)
  end
  result
end
