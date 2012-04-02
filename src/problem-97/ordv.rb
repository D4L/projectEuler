public

# it turns out 2**7830457 is too large, so let's think of something
def ordv
  large = Array.new([0,0,0,0,0,0,0,0,0,1])
  (1..7830457).each do |n|# digit represents ,2^n
    passover = 0
    9.downto(0).each do |i|
      large[i] *= 2
      large[i] += passover
      if large[i] >= 10
        large[i] %= 10
        passover = 1
      else
        passover = 0
      end
    end
  end
  p large.join.to_i
  (28433 * large.join.to_i + 1)%100000000000
end
