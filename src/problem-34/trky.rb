public

# note that since we are adding up individual digits, once we reach 9!, the possibilities will start to become fruitless.
# 9! = 362880
def trky
  result = 0
  i = 10
  (i..362880).each do |i|
    p = i
    sum = 0
    while i != 0
      lala, needtofac = i % 10, 1
      (1..lala).each do |j|
        needtofac *= j
      end
      sum += needtofac
      i /= 10
    end
    result += p if p == sum
  end
  result
end
