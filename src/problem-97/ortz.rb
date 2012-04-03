public

def ortz
  result = 1
  (1..78).each do |i|
    result <<= 100000
    result %= 10000000000
  end
  (1..30457).each do |i|
    result <<= 1
    result %= 10000000000
  end
  (result * 28433 + 1) % 10000000000
end
