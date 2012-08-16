public

# using euclidean algorithm
def intGCDInts a, b
  while b != 0
    t = b
    b = a % b
    a = t
  end
  a
end
