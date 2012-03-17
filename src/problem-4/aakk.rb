public

def aakk
  largest = 0
  (1..999).each do |i|
    (1..999).each do |j|
      if (i * j).to_s.reverse == (i * j).to_s and (i * j) > largest
        largest = i * j
      end
    end
  end
  largest
end
