public

def boolIsPrimeInt n
  return true if n == 2
  (2..Math.sqrt(n).ceil).each do |i|
    return false if n % i == 0
  end
  return true
end
