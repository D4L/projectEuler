public

def airl
  result = 0
  File.open("src/problem-8/number") do |file|
    number = file.read
    i = 0
    ar = Array.new
    ar[0], ar[1], ar[2], ar[3], ar[4] = number[i].to_i, number[i+1].to_i, number[i+2].to_i, number[i+3].to_i, number[i+4].to_i
    while number[i+4]
      if ar.inject(:*) > result
        result = ar.inject(:*)
      end
      i += 1
      ar[0], ar[1], ar[2], ar[3], ar[4] = number[i].to_i, number[i+1].to_i, number[i+2].to_i, number[i+3].to_i, number[i+4].to_i
    end
  end
  result
end
