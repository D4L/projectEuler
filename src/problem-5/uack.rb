public

def uack
  # same as uacc but uses arrPrimeFactor2 instead, it's a slight improvement
  neededMultiples = Array.new
  (1 .. 20).each do |i|
    dupMultiples = Array.new(neededMultiples)
    iFactors = arrPrimeFactors2(i)
    arrPrimeFactors2(i).each do |j|
      if dupMultiples.include?(j) && iFactors.include?(j)
        iFactors.delete_at(iFactors.index(j))
        dupMultiples.delete_at(dupMultiples.index(j))
      end
    end
    neededMultiples.concat(iFactors)
  end
  neededMultiples.inject(:*)
end
