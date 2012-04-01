public

# A bouncy number is one that is neither ascending or descending
# An ascending or descending number is one which when going through the digits, each one is either less or more than the previous one
# an example of a bouncy number is 25394
# an example of a non-bouncy number is 1468
def boolIsBouncyInt i
  numDigits = i.to_s.length
  return false if numDigits < 3 # any number 0-99 is non-bouncy
  sortedNumber = i.to_s.each_char.sort.join.to_i
  sortedNumberReverse = sortedNumber.to_s.reverse.to_i
  return false if sortedNumber % 10 == sortedNumber / 10**(numDigits - 1)
  if i % 10 == sortedNumber % 10 # this means it's an ascending number
    return (not sortedNumber == i)
  elsif i % 10 == sortedNumberReverse % 10 # this means it's a descending number
    return (not sortedNumberReverse == i)
  end
  true
end
# 6263746982
