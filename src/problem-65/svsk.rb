public

def svsk

  # find the whichever convergent
  limit = 100

  alternator = 2
  contFraction = [2]
  while contFraction.size < limit do
    # this is used to create the crazy sequence
    if alternator % 3 == 0
      contFraction.push alternator / 3 * 2
    else
      contFraction.push 1
    end
    alternator += 1
  end
  numer = contFraction.pop
  denom = 1
  while not contFraction.empty?

    # this does the 1/previous
    numer, denom = denom, numer

    # now we have to add the next one
    numer += contFraction.pop * denom

    # amazingly these are not needed...
    # I think it's just the way e works
    # newnumer = numer / intGCDInts(numer, denom)
    # newdenom = denom / intGCDInts(numer, denom)
    # numer, denom = newnumer, newdenom
  end

  # also, don't forget to add the numerator!
  intSumOfDigitsInt2 numer
end
