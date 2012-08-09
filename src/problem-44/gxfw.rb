public

# Gives answer, but massively slow
def gxfw
  numSeed = 2500
  pentagonalNumbers = arrPentagonalNumberListInt numSeed

  # Goes through every number and checks if it's in the list
  numSeed.times do |i|
    i.times do |j|
      uppernum = pentagonalNumbers[i]
      lowernum = pentagonalNumbers[j]
      if pentagonalNumbers.include?(uppernum - lowernum) and pentagonalNumbers.include?(uppernum + lowernum)
        p uppernum-lowernum
      end
    end
  end
end
