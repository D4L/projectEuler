public

#note that any number that's hexagonal is also triagle
def jxzd
  hNum, pNum = 1,1
  pN = 1
  hN = 2
  while (hN != pN or pN == 40755)
    if hN > pN
      pNum += 1
      pN = pNum * (pNum * 3 - 1) /2
    else
      hNum += 1
      hN = hNum * (hNum * 2 - 1)
    end
  end
  pN
end
