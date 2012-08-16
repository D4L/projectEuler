public

def oink
  # why is it this? let's look at the math
  # the euler_totient can be solved using the method.. given a number m
  # and m has prime factorization p1**a1 * p2**a2 * ... * pn**an
  # euler_totient(m) = (p1**a1-p1**(a1-1)) * .. * (pn**an-pn**(an-1))
  # 
  # now.. remember what we are trying to do., we are finding a
  # number m such that m/euler_totient(m) is maximized
  # note that m/euler_totient(m)
  # = p1^a1 * p2^a2 * ... * pn^an / ((p1^a1 - p1^(a1-1)) * ... * (pn^an - pn^(an-1)))
  # = (p1 ^ a1 / (p1 ^ a1 - p1 ^ (a1 - 1))) * ... * (pn ^ an / (pn ^ an - pn ^ (an - 1)))
  # = (p1 ^ a1 / (p1 ^ (a1 - 1) * (p1 - 1))) * ... * (pn ^ an / (pn ^ (an - 1) * (pn - 1)))
  # = (p1 / (p1 - 1)) * ... * (pn / (pn - 1))
  #
  # what does this mean? it means that the value we are trying to find does
  # not depend on any number of a's.. that is, even if our number was pk^ak where
  # ak was extremely high, it won't make m/euler_totient(m) any higher
  #
  # now, note that as i -> infinite, i/(i-1) = 1, thus, to maximize, we may want to
  # use the smallest numbers as we can so that i/(i-1) isn't the identity number
  #
  # thus, we start with the smallest prime and begin choosing while keeping the
  # product under 1000000

  2 * 3 * 5 * 7 * 11 * 13 * 17
end
