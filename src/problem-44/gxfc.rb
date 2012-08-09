public

def gxfc
  numSeed = 2500
  pentagonalNumbers = []

  result = nil

  pentagonalNumbers.push intGetPentagonalInt 1
  pentagonalNumbers.push intGetPentagonalInt 2

  3.upto(numSeed) do |i|
    nextNumber = intGetPentagonalInt i
    pentagonalNumbers.each do |j|
      if boolIsPentagonalInt(nextNumber + j) and boolIsPentagonalInt(nextNumber - j)
        result = nextNumber - j
      end
    end
    pentagonalNumbers.push nextNumber
  end
  result
end
