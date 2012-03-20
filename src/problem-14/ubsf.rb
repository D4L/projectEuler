public

def ubsf
  result = Array.new([1,1])
  (2..1000000).each do |i|
    number = i
    chainlength = 0
    while i != 1
      if i % 2 == 0
        i /= 2
      else
        i = i * 3 + 1
      end
      chainlength += 1
    end
    result.push [number, chainlength] if chainlength > result.last[1]
  end
  result.last[0]
end
