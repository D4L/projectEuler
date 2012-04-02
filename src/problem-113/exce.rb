public

def exce
  digits = 3
  2 * exce1(digits,9)
end

# this should cover all descending numbers
def exce1 i, n
  if i == 0
    return 1
  else
    result = 0
    (0..n).each do |k|
      result += exce1(i-1, k)
    end
    return result
  end
end

# this should cover all ascending numbers
def exce2 i, n
  if i == 0
    return 1
  else
    result = 0
    (n..9).each do |k|
      result += exce2(i-1, k)
    end
    return result
  end
end
