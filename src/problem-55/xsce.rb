public

def xsce
  result = 0
  i = 1
  while i < 10000
    k = i
    allgood = 0
    (1..50).each do
      k = k + k.to_s.reverse.to_i
      if boolIsPalindromeInt(k)
        allgood = 1
        break
      end
    end
    if allgood == 0
      result += 1
    end
    i += 1
  end
  result
end
