public

def orly
  ans = 1
  base = 2**100000 % 10000000000
  rem = 2**30457 % 10000000000
  (1..78).each do
    ans *= base
    ans %= 10000000000
  end
  (rem * ans * 28433 + 1) % 10000000000
end
