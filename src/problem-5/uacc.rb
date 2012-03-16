public

def uacc
  # Same as uacs but now let's try to code the process
  neededMultiples = Array.new
  (1 .. 20).each do |i|
    dupMultiples = Array.new(neededMultiples)
    iFactors = arrPrimeFactors(i)
    arrPrimeFactors(i).each do |j|
      if dupMultiples.include?(j) && iFactors.include?(j)
        iFactors.delete_at(iFactors.index(j))
        dupMultiples.delete_at(dupMultiples.index(j))
      end
    end
    neededMultiples.concat(iFactors)
  end
  neededMultiples.inject(:*)
end
