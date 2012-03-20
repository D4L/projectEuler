public

def dmqc
  result = 0
  File.open("src/problem-13/numbers").each do |i|
    result += i[0,11].to_i
  end
  result.to_s[0,10]
end
