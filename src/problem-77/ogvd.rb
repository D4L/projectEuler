public

def ogvd
  # setup
  limit = 5000
  # table counts the number of primes that can sum up to a
  # certain number given that each prime in the sum is
  # smaller or equal to a number
  table = [[1],[0],[1],[0,1]]
  listOfPrimes = [2,3]

  # we will work on n and wait until number of summations > limit
  n = 4

  while true
    isPrime = boolIsPrimeInt n
    newRow = []

    # finds the appropriate table sum and adds to the new row
    listOfPrimes.each_with_index do |prime, index|
      newRow.push table[n - prime][0..index].inject(&:+)
    end

    # add the new prime if appropriate
    listOfPrimes.push n if isPrime
    newRow.push 1 if isPrime

    # push the new row into the table of number of sums
    table.push newRow

    break if newRow.inject(&:+) >= limit
    n += 1
  end
  n
end
