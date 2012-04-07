public

def rwsg
  result = 0
  max = 0
  (1..1000).each do |p|
    temp = 0
    ((p/3)..p).each do |c|
      (1..c).each do |a|
        if c**2 == a**2 + (p-c-a)**2
          temp += 1
        end
      end
    end
    if temp > max
      max = temp
      result = p
    end
  end
  result
end
