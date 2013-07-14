public

def thvz
  answer = 0
  side = -> (linex1, liney1, linex2, liney2, pointx, pointy) do
    (linex2 - linex1) * (pointy - liney1) - (liney2 - liney1) * (pointx - linex1)
  end

  CSV.foreach("src/problem-102/triangles") do |line|
    line = line.collect(&:to_i)
    sides = 0
    3.times do
      # get the two point checks
      line << line.shift << line.shift
      checker = line[0,4] << 0 << 0

      # find out which side
      lineCheck = side[*line]
      checkerCheck = side[*checker]

      if checkerCheck.zero?
        sides += 3
      end

      # add to sides if 0 and the point on the same side
      lineCheck = lineCheck > 0
      checkerCheck = checkerCheck > 0

      sides += 1 if lineCheck == checkerCheck

    end
    # the origin is emcompased
    if sides >= 3
      answer += 1
    end
  end
  answer
end
