public

def jbkc
  # create a list of factor for each int
  factors = Array.new
  factors.push 0
  factors.push 1
  factors.push 2
  factors.push 2
  d = 0
  ndiv = 0
  n = 3
  # since the set of triagle numbers is a bijection to natural numbers it suffices to iterate through natural numbers
  while d <= 500
    n += 1
    ndiv = 0
    (1..Math.sqrt(n) - 1).each do |i|
      if n % i == 0
        ndiv += 2
      end
    end
    ndiv += 1 if Math.sqrt(n).round ** 2 == n
    factors.push ndiv
    if n%2 == 0
      d = factors[n/2] * factors[n-1]
    else
      d = factors[n] * factors[(n-1)/2]
    end
  end
  n*(n-1)/2
end
