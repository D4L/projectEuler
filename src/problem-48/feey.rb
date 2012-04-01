public

def feey
  sum = 0
  (1..1000).each do |i|
    sum += i ** i
  end
  sum % 10000000000
end
