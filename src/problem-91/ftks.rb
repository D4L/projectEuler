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
  (2..(limit - 1)).each do |long|
    (1..(long - 1)).each do |tall|
      gcd = intGCDInts long, tall
      longd, talld = long / gcd, tall / gcd
      long -= talld
      tall += longd
      while long >= 0 and tall <= limit
        long -= talld
        tall += longd
        result += 2
      end
      long = longd * gcd
    end
  end
  result
end
