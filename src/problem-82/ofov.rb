public

# copy most of problem 83
def ofov
  matrix = []
  File.open("src/problem-82/matrix.txt").each do |l|
    matrix.push l.chop.split(',').map { |num| num.to_i }
  end

  finishLocation = 0

  # might want to transpose the matrix such that, index wise...
  # [[0, 80, 160, ...],
  #  [1, 81, 161, ...],
  #  ...
  #  [79, 159, 239, ...]]
  matrix = matrix.transpose

  # make the matrix one dimentional plz
  matrix.flatten!

  # test matrix
  # matrix = [5, 6, 7, 8, 1, 2, 4, 5, 2, 9, 7, 3, 100, 5, 2, 8]

  # setup, we already have the first coordinate
  alreadyHave = [-1]
  possibleEdges = {}
  (0..79).each do |beginvertex|
    possibleEdges[[-1, beginvertex]] = matrix[beginvertex]
  end
  minimalSpanningTree = []

  # We will keep going and inside, will break by itself
  while true

    # finding the next coordinate to add to alreadyhave
    nextAdd = possibleEdges.min_by { |edge, val| val }
    nextCoor = nextAdd[0][1]

    alreadyHave.push nextCoor

    # prepping possibleEdges
    possibleEdges.delete_if { |edge, val| edge[1] == nextCoor }
    possibleEdges.each do |edge, val|
      possibleEdges[edge] -= nextAdd[1]
    end

    # add this edge to the tree
    minimalSpanningTree.push nextAdd[0]

    if nextCoor >= 6320
      finishLocation = nextCoor
      break
    end

    # adding the next coordinates
    [80, -1, 1].each do |offset|

      addEdgeCoor = offset + nextCoor

      # check not out of bounds
      case offset
      when 1
        next if addEdgeCoor % 80 == 0
      when -1
        next if addEdgeCoor % 80 == 79
      end

      # check doesn't already iclude
      next if alreadyHave.include? addEdgeCoor

      # add the new edge
      possibleEdges[[nextCoor, addEdgeCoor]] = matrix[addEdgeCoor]

    end
  end

  # compute sum of min path
  start = finishLocation
  result = matrix[finishLocation]
  while start >= 80
    start = minimalSpanningTree.find{|edge| edge[1] == start}[0]
    result += matrix[start]
  end

  result

end
