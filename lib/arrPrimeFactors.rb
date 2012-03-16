public

# Grab the Prime Factors
def arrPrimeFactors (n)
  result = Array.new
  while n != 1
    (2 .. n).each do |i|
      if n % i == 0
        result.push i
        n /= i
        break
      end
    end
  end
  result
end
