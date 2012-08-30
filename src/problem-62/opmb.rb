public

def opmb
  limit = 5
  max = 10
  cuber = 1
  goodGroup = []
  goodPermutation = 0

  # need to find the good collection and numbers
  while true

    # collect all the cubes in a range
    cubesInRange = []
    while cuber ** 3 < max
      cubesInRange.push cuber ** 3
      cuber += 1
    end

    # sort them in descending order after descending ordering each
    sortedCubes = cubesInRange.map do |i|
      i.to_s.each_char.sort{|i,j| j <=> i}.join.to_i
    end.sort

    # check if the cubes's mode have the limit
    if sortedCubes.mode.find {|i,j| j == limit}
      goodGroup = cubesInRange
      goodPermutation = sortedCubes.mode.collect {|i,j| i}
      break
    end

    max *= 10
  end

  goodGroup.each do |i|
    return i if goodPermutation.include? i.to_s.each_char.sort{|i,j| j <=> i}.join.to_i
  end
  p "You've been trickled"

end
