public

def kpvj
  result= 0
  File.open("src/problem-54/poker").each do |line|
    a = Hand.new(line[0,14])
    b = Hand.new(line[15,30])
    aS = a.getScore
    bS = b.getScore
    result += 1 if aS > bS
    if aS == bS
      if aS == 0
        result += 1 if a.getSingleScore > b.getSingleScore
      else
        result += 1 if a.getDoubleScore > b.getDoubleScore
      end
    end
  end
  result
end
