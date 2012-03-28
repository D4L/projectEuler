public

# since we know that the max is 1000000, let's try iterating over numbers this time.
def pzoe
  sum = 0
  (0..9).each do |a|
    (0..9).each do |b|
      (0..9).each do |c|
        (0..9).each do |e|
          (0..9).each do |f|
            (0..9).each do |g|
              sum += a * 100000 + b * 10000 + c * 1000 + e * 100 + f * 10 + g if a * 100000 + b * 10000 + c * 1000 + e * 100 + f * 10 + g == a ** 5 + b ** 5 + c ** 5 + e ** 5 + f ** 5 + g ** 5
            end
          end
        end
      end
    end
  end
  sum - 1
end
