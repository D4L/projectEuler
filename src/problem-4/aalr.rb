public

def aalr
  largest = 0
  999.downto(1).each do |i|
    999.downto(i).each do |j|
      if (i * j) > largest
        if (j * i).to_s.reverse == (i * j).to_s
          largest = i * j
        end
      else
        break
      end
    end
  end
  largest
end
