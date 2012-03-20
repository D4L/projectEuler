public

def jfao
  result = 0
  (2**1000).to_s.bytes.each do |i|
    result += i - 48
  end
  result
end
