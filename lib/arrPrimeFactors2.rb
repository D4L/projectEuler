public

# Same as first except in n time!
# Based on problem-3/outs.rb
def arrPrimeFactors2 (n)
  result = Array.new
  i = 2
  while n != 1
    if n % i == 0
      n /= i
      result.push i
      next;
    end
    i += 1
  end
  result
end
