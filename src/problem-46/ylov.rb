public

def ylov
  i = 3
  primes = Array.new([3])
  exists = 1
  while exists == 1
    exists = 0
    i += 2
    (3..Math.sqrt(i).ceil).each do |k|
      break if i % k == 0
      if k == Math.sqrt(i).ceil
        primes.push i
        exists = 1
      end
    end
    if exists == 1
      next
    end
    # at this point, we're sure i is a composite number
    primes.each do |k|
      if i == (Math.sqrt((i - k)/2)).round ** 2 * 2 + k
        exists = 1
        break
      end
    end
    break if exists == 0
  end
  i
end
