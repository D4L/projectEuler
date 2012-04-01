public

def umuv
  result = 0
  (4..12000).each do |d|
    ((d/3.0).ceil..d/2).each do |n|
      result += 1 if d.gcd(n) == 1
    end
  end
  result
end
