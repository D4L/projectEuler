public

# there are 5 basic types of triangles.

def ftks
  limit = 50
  result = 0
  # these are the correct right angles
  result += limit * limit * 3
  # these are the ones on their side
  (1..limit).each do |i|
    result += i / 2 * 2
  end
  # there are some on their little angles
  (2..limit).each do |long|
    (1..(long - 1)).each do |tall|
      gcd = intGCDInts long, tall
      longd, talld = long / gcd, tall / gcd
      maxn = ((limit - long) / talld > tall / longd ? tall / longd : (limit - long) / talld)
      minn = (long / talld > (limit - tall) / longd ? (limit - tall) / longd : long / talld)
      # p "(#{long}, #{tall}) => (#{longd}, #{talld}) : #{maxn} + #{minn}"
      result += (maxn + minn) * 2
    end
  end
  result
end
