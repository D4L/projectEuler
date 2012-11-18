public

# go through numbers 0 to infinite starting min and ending max
# NOTE that the minimal number will be method(0)
# NOTE that min, max is non inclusive
def arrNumbersOfProcGivenMinMax( method, min, max )
  result = []
  i = 0
  while method.call(i) < min
    i += 1
  end
  while method.call(i) < max
    result << method.call(i)
    i += 1
  end
  result
end
