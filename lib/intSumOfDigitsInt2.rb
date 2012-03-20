public
# BETTER

# does same as intSumOfDigitsInt but supposed to be better
def intSumOfDigitsInt2 i
  result = 0
  i.to_s.bytes.each do |i|
    result += i - 48
  end
  result
end
