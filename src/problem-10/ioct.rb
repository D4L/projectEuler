public

def ioct
  result = 5
  i = 2
  while i < 2000000
    i += 1
    (2..Math.sqrt(i).ceil+1).each do |j|
      break if i % j == 0
      result += i if j == Math.sqrt(i).ceil+1
    end
  end
  result
end
