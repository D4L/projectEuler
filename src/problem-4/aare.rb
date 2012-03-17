public

def aare
  largest = 0
  999.downto(1).each do |i|
    999.downto(i).each do |j|
      if (i * j).to_s.reverse == (i*j).to_s and (i * j) > largest
        largest = i * j
      end
    end
  end
  largest
end
