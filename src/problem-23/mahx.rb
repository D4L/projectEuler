public

def mahx
  # need to increase limit for overflow
  limit = 28123
  overflowlimit = limit + 100
  # First collect all the abundant numbers that are of interest to us
  abundantNumbers = []
  (1..overflowlimit).each do |i|
    if arrDivisorsInt(i).sum - i > i
      abundantNumbers << i
    end
  end

  # next, collect all the numbers that can be written as a
  # sum of two abundant numbers
  abundantNumbersSummed = {}
  abundantNumbers.each_with_index do |num, index|
    # don't count the overflow
    break if num > limit
    while num + abundantNumbers[index] < limit
      abundantNumbersSummed[num + abundantNumbers[index]] = 1
      index += 1
    end
  end

  result = 0
  (1..limit-1).each do |i|
    result += i if abundantNumbersSummed[i].nil?
  end
  result

end
