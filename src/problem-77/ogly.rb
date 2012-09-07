public

# this is an optimization of ogvd.. i think
# Okay, it could be btr, it stores the sum in case it's useful
# Did a couple more tests, when limit gets larger,
# this is a worthwhile optimization
def ogly
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
      if index >= table[n - prime].length - 1
        newRow.push table[n - prime].last
      else
        newRow.push table[n - prime][0..index].inject(&:+)
      end
    end

    # add the new prime if appropriate
    listOfPrimes.push n if isPrime
    newRow.push 1 if isPrime

    rowSum = newRow.inject(&:+)
    newRow.push rowSum

    # push the new row into the table of number of sums
    table.push newRow

    break if rowSum  >= limit
    n += 1
  end
  n
end
