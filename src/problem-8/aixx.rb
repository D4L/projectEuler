public

def aixx
  result = 0
  number = File.open("src/problem-8/number")
  number2 = File.open("src/problem-8/number")
  temp = 1
  temp *= number.getc.to_i * number.getc.to_i * number.getc.to_i * number.getc.to_i
  while d = number.getc
    temp *= d.to_i if d.to_i != 0
    if temp > result
      result = temp
    end
    e = number2.getc.to_i
    temp /= e if e != 0
  end
  number.close
  result
end
