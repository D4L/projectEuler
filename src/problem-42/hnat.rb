public

def hnat
  result = 0
  triagleNumbers = Array.new(18) {|i| (i+1) * (i + 2) / 2}
  words = File.open("src/problem-42/words")
  words.getc
  cur_word = 0
  while c = words.getc
    if c == '"'
      words.getc
      words.getc
      result += 1 if triagleNumbers.include? cur_word
      cur_word = 0
    else
      c.bytes.each do |i|
        cur_word += i - 64
      end
    end
  end
  words.close
  result
end
