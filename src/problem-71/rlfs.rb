public

def rlfs
  target = 3.to_f/7.to_f
  highest = 0
  answer = 0
  numberator = 0
  (3..1000000).each do |i|
    while numberator.to_f / i.to_f  < target
      if numberator.to_f / i.to_f > highest
        answer = numberator
        highest = numberator.to_f / i.to_f
      end
      numberator += 1
    end
  end
  answer
end
