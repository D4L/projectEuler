public

# note that any number with a 10 as it's base cannot fulfill this requirement.
def inmj
  result = 0
  (1..9).each do |base|
    exponent = 1
    while (intGetLengthInt(base ** exponent) == exponent)
      result += 1
      exponent += 1
    end
  end
  result
end
