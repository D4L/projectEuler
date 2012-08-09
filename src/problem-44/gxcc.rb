public

def gxcc
  limit = 2500
  result = nil
  1.upto(limit) do |i|
    i.downto(1) do |j|
      penti = intGetPentagonalInt i
      pentj = intGetPentagonalInt j
      if boolIsPentagonalInt(penti + pentj) and boolIsPentagonalInt(penti - pentj)
        result = penti - pentj
      end
    end
  end
  result
end
