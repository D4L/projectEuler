public

# this doesn't work :(
def prog
  return 0
  d = 2
  a = 1
  while a >= (15499.0/94744)
    d += 1
    temp = 0
    (0..(d-1)).each do |n|
      if d.gcd(n) == 1
        temp += 1
      end
    end
    a = temp/(d - 1.0)
  end
  d
end
