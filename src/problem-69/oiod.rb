public

def oiod

  # retrieve the euler_totient table
  euler_totient = Array.new(1000000) do |i|
    n = 1
    arrPrimeFactorizationInt(i + 2).each do |set|
      n *= (set[0] ** set[1]) - (set[0] ** (set[1] - 1))
    end
    n
  end

  # find the largest relativeprime
  n = 2
  max = 0
  maxn = 0
  euler_totient.each do |i|
    if n.to_f / i > max
      max = n.to_f / i
      maxn = n
    end
    n += 1
  end
  maxn
end
