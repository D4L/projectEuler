public

def tree
  result = 0
  factorials = [1,1,2,6,24,120,720,5040,40320,362880]
  (10..362880).each do |i|
    sum = 0
    stringies = i.to_s
    length = stringies.length
    while length > 0
      length -= 1
      sum += factorials[stringies[length].to_i]
      break if sum > i
    end
    result += i if i == sum
  end
  result
end
