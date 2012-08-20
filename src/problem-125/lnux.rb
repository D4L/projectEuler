public

def lnux
  limit = 10**8
  sqrt_limit = Math.sqrt(limit/2)
  result = []
  (1..sqrt_limit).each do |i|
    sos = i**2
    ((i+1)..sqrt_limit).each do |n|
      sos += n**2
      break if sos >= limit
      result.push sos if boolIsPalindromeInt sos
    end
  end
  result.uniq!
  result.inject(&:+)
end
