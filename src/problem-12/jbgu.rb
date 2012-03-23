public

def jbgu
  result = 1
  i = 1
  d = 0
  while d < 500
    i += 1
    result += i
    d = 0
    (1..Math.sqrt(result) - 1).each do |i|
      if result % i == 0
        d += 2
      end
    end
    if Math.sqrt(result).round ** 2 == result
      d += 1
    end
  end
  result
end
