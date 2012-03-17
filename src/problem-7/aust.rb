public

def aust
  i = 0
  result = 2
  while true
    (2..Math.sqrt(result).ceil+1).each do |j|
      if j == Math.sqrt(result).ceil+1 || result == 2
        i += 1
        return result if i == 10001
      end
      if result % j == 0
        break
      end
    end
    result += 1
  end
end
