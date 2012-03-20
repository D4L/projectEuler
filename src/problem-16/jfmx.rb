public

def jfmx
  result = 0
  bigNumber = 2 ** 1000
  while bigNumber != 0
    result += bigNumber % 10
    bigNumber /= 10
  end
  result
end
