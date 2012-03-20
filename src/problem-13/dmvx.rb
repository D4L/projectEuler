public

def dmvx
  result = 0
  File.open("src/problem-13/numbers").each do |i|
    result += i.to_i
  end
  result.to_s[0,10]
end
