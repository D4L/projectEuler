public

def aecy
  # note that every 3rd value is even
  # 1. odd + even = odd
  # 2. even + odd = odd
  # 3. odd + odd = even
  # repeat
  # Thus.. 2, 8, 34... maybe there's something in that
  result, i = 0, 3
  while (j = fibGetSingle(i)) < 4000000
    result += j
    i += 3
  end
  result.to_i
end
