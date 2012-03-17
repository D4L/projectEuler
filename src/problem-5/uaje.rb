public

def uaje
  #doing uaio but properly, no mystery number
  neededMultiples = Array.new
  (1..20).each do |i|
    neededMultiples |= arrPrimeFactors(i)
  end
  primeProduct = neededMultiples.inject(:*)
  result = 0
  while true
    result += primeProduct
    (1..20).each do |i|
      break if not result % i == 0
      return result if i == 20
    end
  end
end
