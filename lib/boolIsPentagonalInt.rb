public

def boolIsPentagonalInt n
  n = (Math.sqrt(24*n + 1) + 1) / 6
  n.floor == n
end
