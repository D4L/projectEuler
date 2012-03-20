public

# Keep dividing by 10 and grabbing the 1's digit
def intSumOfDigitsInt(i)
  result = 0
  while i != 0
    result += i % 10
    i /= 10
  end
  result
end
