public

def feck
  sum = 0
  (1..1000).each do |i|
    sum += i ** i % 10000000000
  end
  sum % 10000000000
end
