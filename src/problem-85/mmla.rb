public

# we aren't going to brute force it, rather, use an table and a well calculated formula
# that is, it keeps going up in an arithmetic pattern
#   x 1  2  3  4  5  6
# y X------------------
# 1 | 1  3  6  10 15 21
# 2 | 3  9  18 30 45
# 3 | 6  18
# 4 | 10 30
# 5 | 15 45
# 6 | 21
def mmla
  theRoots = Array.new
  n = 0
  i = 1
  begin
    n += i
    theRoots.push n
    i += 1
  end while n*3 < 2000000
  result = 0
  smallest = 1000
  # to get the values of teh chart using x, y
  # intArithmeticSequenceValues(x, theRoots[y-1], x * theRoots[y-1)
  theRoots.each do |r|
    i = 1
    begin
      n = intArithmeticSequenceValues(i, r, i*r)
      if (2000000-n).abs < smallest
        smallest = (2000000-n).abs
        result = i * (theRoots.index(r) + 1)
      end
      i += 1
    end while n < 2000000
  end
  result
end
