public

def ubrl
  result = Array.new([1,1])
  available = Array.new(1) {|i| i + 1}
  available.each do |i|
    p i
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
  $fullresults = 2
  assigner
  result.last[0]
end

private

def assigner
  p $fullresults
end
