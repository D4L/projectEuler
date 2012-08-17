public

def hgxi
  result = 0
  (1..1000000000).each do |i|
    next if i % 10 == 0
    result += 1 if (i + i.to_s.reverse.to_i).to_s.count("02468") == 0
  end
  result
end
