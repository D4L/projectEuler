public

def rwzr
  result = Array.new(1001) {|i| i = 0}
  (1..500).each do |a|
    (1..a).each do |b|
      c = Math.sqrt(a**2 + b**2).round
      if (c)**2 == a**2 + b**2
        result[a + b + c] += 1 if a + b + c < 1001
      end
    end
  end
  result.index(result.max)
end
