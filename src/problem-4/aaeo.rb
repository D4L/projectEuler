public

def aaeo
  largest = 0
  (1..999).each do |i|
    999.downto(1).each do |j|
      if (i * j).to_s.reverse == (i * j).to_s and (i * j) > largest
        largest = i * j
        break
      end
    end
  end
  largest
end
