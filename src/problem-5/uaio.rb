public

def uaio
  result = 0
  while true
    # we have to add the multiplicitive result of the primes, doing 1 is wayyy to slow
    # 2 * 3 * 5 * 7 * 11 * 13 * 17 * 19
    result += 9699690
    (1..20).each do |i|
      break if not result % i == 0
      return result if i == 20
    end
  end
end
