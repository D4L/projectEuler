public

$esxlDiagonalMemo = Array.new(51) {[]}
$esxlStraightMemo = Array.new(51) {[]}
def esxl
  esxlBaseCaseFill
  answer = 0
  (1..47).each do |a|
    (1..43).each do |b|
      answer += esxlRecurse(a,b)
    end
  end
  answer
end

def esxlBaseCaseFill
  (0..50).each do |i|
    $esxlDiagonalMemo[i][0] = 0
    $esxlDiagonalMemo[0][i] = 0
  end
  $esxlDiagonalMemo[1][1] = 0
  (2..50).each do |i|
    $esxlDiagonalMemo[1][i] = i-1
    $esxlDiagonalMemo[i][1] = i-1
  end
  $esxlStraightMemo[1][1] = 1
  base = 1
  (2..50).each do |i|
    base += i
    $esxlStraightMemo[1][i] = base
    $esxlStraightMemo[i][1] = base
  end
end

# let i, j be the dimension of the rectangle we want
def esxlRecurse i, j
  esxlStraightRecurse(i, j) + esxlDiagonalRecurse(i, j)
end

def esxlStraightRecurse i, j
  return $esxlStraightMemo[i][j] if $esxlStraightMemo[i][j]
  $esxlStraightMemo[i][j] = esxlStraightRecurse(i-1, j) + i * esxlStraightRecurse(1, j)
end

def esxlDiagonalRecurse i, j
  return $esxlDiagonalMemo[i][j] if $esxlDiagonalMemo[i][j]
  # make i the larger
  i, j = j, i if j > i
  $esxlDiagonalMemo[i][j] = if i == j
                              2 * esxlDiagonalRecurse(i-1,j) - esxlDiagonalRecurse(i-2,j) + 7 + 8*(j-2)
                            else
                              # i is larger for sure
                              esxlDiagonalRecurse(i-1, j) + ((1..j).collect do |k|
                                k * 2 - 1 + ((1..2*(k-1)).collect do |n|
                                  2 * n
                                end.inject(&:+) || 0)
                              end.inject(&:+) || 0)
                            end
end
