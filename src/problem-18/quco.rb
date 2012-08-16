public

def quco
  triangle = File.open("src/problem-18/triangle").collect {|l| l.split.map {|i| i.to_i}}
  (triangle.length-2).downto(0) do |row|
    (0..row).each do |col|
      triangle[row][col] += (triangle[row+1][col] > triangle[row+1][col+1] ? triangle[row+1][col] : triangle[row+1][col+1])
    end
  end
  triangle[0][0]
end
