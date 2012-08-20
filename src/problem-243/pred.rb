public

# the resilient fraction is apparently all the numbers that gcd = 1
# it seems like resilient fraction(m) = euler_totient(m) / m-1
# also, remember euler_totient(m) = (p1^a1-p1^(a1-1))*...*(pn^an-pn^(an-1))
# thus resilient_fraction(m)
# = euler_totient(m) / m-1
# = (p1^a1 - p1^(a1-1))*...*(pn^an-pn^(an-1)) / (p1^a1*...*pn^an - 1)
#
# 1/resilient_fraction(m)
# = (p1^a1*...*pn^an - 1) / (p1^a1-p1^(a1-1))*...*(pn^an*pn^(an-1))
# = (p1/(p1-1))*...*(pn/(pn-1)) - 1/(p1^a1-p1^(a1-1))*...*(pn^an*pn^(an-1))
def pred
  result = 0
  a = 2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 * 23
  b = 2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 * 23 * 29
  [a,2 * a,3 * a,4 * a, b].each do |i|
    n = 1
    arrPrimeFactorizationInt(i).each do |set|
      n *= (set[0] ** set[1]) - (set[0] ** (set[1] - 1))
    end
    if n / (i-1).to_f < 15499/94744.0
      return i
    end

  end
end
