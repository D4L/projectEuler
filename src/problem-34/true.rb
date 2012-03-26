public

# same as trky except we use a factorial array
def true
  result = 0
  factorials = [1,1,2,6,24,120,720,5040,40320,362880]
  (10..362880).each do |i|
    p = i
    sum = 0
    while i != 0
      sum += factorials[i % 10]
      i /= 10
    end
    result += p if p == sum
  end
  result
end
