public

def outs
  result = 2
  number = 600851475143
  while number != 1
    if number % result == 0
      number /= result
      next;
    end
    result += 1
  end
  result
end
