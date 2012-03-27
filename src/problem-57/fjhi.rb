public

# Note that this repeating pattern is essentially An = 1 + 1/(1 + A(n-1))
# Since (1 + A(n-1)) is basically the only thing on the denominator,
# we can continuously get denominators, and the numerator is obtained by
# adding the current denominator with the previous denominator
def fjhi
  result = 0
  num = 3
  den = 2
  (1..1000).each do
    num, den = 2 * den + num, num + den
    result += 1 if num.to_s.length > den.to_s.length
  end
  result
end
