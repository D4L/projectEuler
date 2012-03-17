public

def oohh
  (1..1000).each do |i|
    (1..1000).each do |j|
      (1..1000).each do |k|
        if i ** 2 + j ** 2 == k ** 2 and i + j + k == 1000
          return i * j * k
        end
      end
    end
  end
end
