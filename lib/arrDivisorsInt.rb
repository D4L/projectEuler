public

# uses the same formula as problem 12
# iterate through number to sqrt and each divisor pushes two
def arrDivisorsInt (n)
  result = Array.new
  (1..Math.sqrt(n)).each do |i|
    if n % i == 0
      result.push i
      result.push (n/i) if  n/i != i
    end
  end
  result
end
