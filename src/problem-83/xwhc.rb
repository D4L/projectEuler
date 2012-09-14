public

# yeahhhh co250
def xwhc
  matrix = []
  File.open("src/problem-83/matrix.txt").each do |l|
    matrix.push l.chop.split(',').map { |num| num.to_i }
  end
  finishLocation = [79, 79]

  # test matrix
  # matrix = [[5,6,7,8],[1,2,4,5],[2,9,7,3],[100,5,2,8]]

  # setup, we already have the first coordinate
  alreadyHave = [[0, 0]]
  possibleEdges = { [[0, 0], [0, 1]] => matrix[0][1],
                    [[0, 0], [1, 0]] => matrix[1][0]}
  minimalSpanningTree = []

  while not alreadyHave.include? finishLocation

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

    # adding the next coordinates
    [[-1, 0], [0, -1], [1, 0], [0, 1]].each do |offset|

      # check not out of bounds
      next if not (((0..79).include?(nextCoor[0] + offset[0]) and (0..79).include?(nextCoor[1] + offset[1])))

      # check doesn't already iclude
      addEdgeCoor = [nextCoor[0] + offset[0], nextCoor[1] + offset[1]]
      next if alreadyHave.include? addEdgeCoor

      # add the new edge
      possibleEdges[[nextCoor, addEdgeCoor]] = matrix[addEdgeCoor[0]][addEdgeCoor[1]]

    end
  end

  # compute sum of min path
  start = finishLocation
  result = matrix[79][79]
  while start != [0, 0]
    start = minimalSpanningTree.find{|edge| edge[1] == start}[0]
    result += matrix[start[0]][start[1]]
  end

  result
end
