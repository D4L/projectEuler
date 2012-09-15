public

# optimization of xwhc with one dimention array for matrix
def xwgl
  matrix = []
  File.open("src/problem-83/matrix.txt").each do |l|
    matrix.push l.chop.split(',').map { |num| num.to_i }
  end

  # make the matrix one dimentional plz
  matrix.flatten!
  finishLocation = 6399

  # test matrix
  # matrix = [[5,6,7,8],[1,2,4,5],[2,9,7,3],[100,5,2,8]]
  # matrix = [5, 6, 7, 8, 1, 2, 4, 5, 2, 9, 7, 3, 100, 5, 2, 8]

  # setup, we already have the first coordinate
  alreadyHave = [0]
  possibleEdges = { [0, 1] => matrix[1],
                    [0, 80] => matrix[80]}
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
    [-80, 80, -1, 1].each do |offset|

      addEdgeCoor = offset + nextCoor

      # check not out of bounds
      case offset
      when 1
        next if addEdgeCoor % 80 == 0
      when -1
        next if addEdgeCoor % 80 == 79
      when -80
        next if addEdgeCoor < 0
      when 80
        next if addEdgeCoor > 6399
      end

      # check doesn't already iclude
      next if alreadyHave.include? addEdgeCoor

      # add the new edge
      possibleEdges[[nextCoor, addEdgeCoor]] = matrix[addEdgeCoor]

    end
  end

  # compute sum of min path
  start = finishLocation
  result = matrix[6399]
  while start != 0
    start = minimalSpanningTree.find{|edge| edge[1] == start}[0]
    result += matrix[start]
  end

  result

end
