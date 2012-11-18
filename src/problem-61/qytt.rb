public

# same as qytj except we use threading
def qytt
  # procure the numbers
  arrNumbers = [ arrNumbersOfProcGivenMinMax( method(:intGetTriangleInt), 1000, 10000),
                 arrNumbersOfProcGivenMinMax( method(:intGetSquareInt), 1000, 10000),
                 arrNumbersOfProcGivenMinMax( method(:intGetPentagonalInt), 1000, 10000),
                 arrNumbersOfProcGivenMinMax( method(:intGetHexagonalInt), 1000, 10000),
                 arrNumbersOfProcGivenMinMax( method(:intGetHeptagonalInt), 1000, 10000),
                 arrNumbersOfProcGivenMinMax( method(:intGetOctagonalInt), 1000, 10000) ]
  arrNumbers.map! do |arr|
    deletable = []
    arr.each do |num|
      if ( num / 10 % 10 == 0 )
        deletable << num
      end
    end
    arr -= deletable
  end

  # get the hash numbers which we will jump to and from
  hashNumbers = Array.new(6){ HashChained.new }
  (0..5).each do |i|
    arrNumbers[i].each do |num|
      hashNumbers[i][num/100] = num % 100
    end
  end

  threads = []
  # we're guaranteed only one solution
  superResult = 0

  # iterate through the octagonal numbers
  arrNumbers.last.each do | firstNum |
    checker = firstNum % 100
    hashNumbers[0..4].permutation.each do |perm|
      t = Thread.new do
        result = qyttRecursion( checker, perm )
        if result[0] > 0 && result[1] == firstNum / 100
          superResult = result[0] + firstNum
        end
      end
      threads << t
    end
  end

  threads.each do |t|
    t.join
  end
  superResult

end

def qyttRecursion( check, hash )
  # this makes the compare an array
  compare = [*hash.shift[ check ]]
  return [ -60000, 0 ] if compare.empty?
  compare.each do | num |
    if hash.empty?
      return [ check * 100 + num, num ]
    else
      result = qyttRecursion( num, hash )
      return [ result[0] + check * 100 + num, result[1] ]
    end
  end
end
