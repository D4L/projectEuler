public

def znyx
  # we know that the max is probably 80 primes so n = 80 will be our max, a = 1000 and b = 1000 are our maxes, thus, thu max candidate for our prime is 80^2 + 80*1000 + 1000 = 87400
  # we will create a prime list up to this number
  primes = arrPrimeNumbersMax(87400)
  maxA = 0
  maxB = 0
  maxPrimes = 0
  (-1000..1000).each do |a|
    (-1000..1000).each do |b|
      (0..80).each do |n|
        if not primes.include? n**2 + n * a + b
          if n > maxPrimes
            maxA = a
            maxB = b
            maxPrimes = n
          end
          break
        end
      end
    end
  end
  maxA * maxB
end
