public

def ccao
  result = 0
  highestCycle = 0
  arrPrimeNumbersMax(1000).each do |i|
    (1..(i-1)).each do |n|
      if ((10 ** n) - 1) % i == 0
        if n > highestCycle
          highestCycle = n
          result = i
        end
        break
      end
    end
  end
  result
end
