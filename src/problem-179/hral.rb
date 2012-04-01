public

def hral
  count = 0
  numDivisors = Array.new
  isPrime = Array.new
  remain = Array.new
  (0..10000001).each do |i|
    remain.push i
    isPrime.push true
    numDivisors.push 1
  end
  (2..5000000).each do |i|
    if isPrime[i]
      n = i * 2
      begin
        isPrime[n] = false
        c = 0
        while (remain[n] && remain[n] > 1 and remain[n] % i == 0)
          remain[n] /= i
          c += 1
        end
        numDivisors[n] *= c + 1
        n += i
      end while n < 10000000
    end
  end
  (2..9999999).each do |i|
    count += 1 if numDivisors[i] == numDivisors[i+1]
  end
  count
end
