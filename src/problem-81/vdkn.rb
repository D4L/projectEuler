public

# [0][0] ... [0][79]
#  ...         ...
# [79][0] ... [79][79]
def vdkn
  matrix = File.open("src/problem-81/matrix").collect {|l| l.chop.split(',').map {|i| i.to_i}}
  matrix[0].each_index do |i|
    next if i == 0
    matrix[0][i] += matrix[0][i-1]
    matrix[i][0] += matrix[i-1][0]
  end
  (1..79).each do |m|
    (1..79).each do |n|
      matrix[m][n] += (matrix[m-1][n] > matrix[m][n-1] ? matrix[m][n-1] : matrix[m-1][n])
    end
  end
  matrix[79][79]
end
