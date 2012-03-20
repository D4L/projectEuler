public

def ubcc
  result = [1,1]
  (2..1000000).each do |i|
    number = i
    chainlength = 0
    while i != 1
      if i % 4 == 0
        i /= 4
        chainlength += 2
      elsif i % 2 == 0
        i /= 2
        chainlength += 1
      else
        i = i * 3 + 1
        chainlength += 1
      end
    end
    result = [number,chainlength] if chainlength > result[1]
  end
  result[0]
end
