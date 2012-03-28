public

# note: 9^5 is 59049. 9999 would be 236196 and 99999 would be 295245. Thus, anything above 1000000 would most likely have a sum that's too high.
def pzvz
  sum = 0
  (10..1000000).each do |i|
    csum = 0
    comp = i
    while i > 0
      csum += (i % 10) ** 5
      i /= 10
    end
    sum += comp if comp == csum
  end
  sum
end
