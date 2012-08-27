public

# using the log_b(a) = log a / log b trick,
# we'll break this down happily
def arrSumOfPowersOfTwoInt i
  result = []
  while i != 0
    nextPower = (Math.log(i) / Math.log(2)).floor
    result.push nextPower
    i -= 2**nextPower
  end
  result
end
