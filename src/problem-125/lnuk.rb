public

def lnuk
  limit = 10**8
  result = []
  (1..Math.sqrt(limit/2)).each do |i|
    consecutive = i + 1
    i **= 2
    i += consecutive ** 2
    while (i < limit) do
      result.push i if boolIsPalindromeInt i
      consecutive += 1
      i += consecutive ** 2
    end
  end
  result.uniq!
  result.inject(&:+)
end
