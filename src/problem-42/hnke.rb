public

def hnke
  result = 0
  triagleNumbers = Array.new(18) {|i| (i + 1) * (i+2) / 2}
  words = File.read("src/problem-42/words").gsub(/(^.|.$)/,'').split(/","/).each do |w|
    curWord = 0
    w.bytes.each do |i|
      curWord += i - 64
    end
    result += 1 if triagleNumbers.include? curWord
  end
  result
end
