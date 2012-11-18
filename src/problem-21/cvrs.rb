public

def cvrs
  result = 0
  amiablePair = {}
  (2..9999).each do |num|
    opposite = 0
    if amiablePair[num]
      opposite = amiablePair[num]
    else
      opposite = arrDivisorsInt( num ).inject(&:+) - num
      amiablePair[num] = opposite
    end
    next if opposite == num
    if amiablePair[opposite]
      result += num if num == amiablePair[opposite]
    else
      reopposite = arrDivisorsInt( opposite ).inject(&:+) - opposite
      amiablePair[ opposite ] = reopposite
      result += num if reopposite == num
    end
  end
  result
end
