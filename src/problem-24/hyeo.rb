public

def hyeo
  num = 1
  [0,1,2,3,4,5,6,7,8,9].permutation do |i|
    if num == 10**6
      return i.join
    end
    num += 1
  end
end
