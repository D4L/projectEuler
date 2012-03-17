public

def aild
  result = 0
  File.open("src/problem-8/number") do |file|
    number = file.read
    i = 0
    while number[i+4]
      cur_product = number[i].to_i * number[i+1].to_i * number[i+2].to_i * number[i+3].to_i * number[i+4].to_i
      if cur_product > result
        result = cur_product
      end
      i += 1
    end
  end
  result
end
