public

def hnra
  atn = all_triangle_numbers(30)
  words = File.read("src/problem-42/words").split(',')
  count = 0
  words.each do |w|
    w.split("\"").each do |x|
      word_count = 0
      x.bytes.each do |c|
        word_count += c - 64
      end
      count += 1 if atn.include?(word_count)
    end
  end
  count
end

private

def all_triangle_numbers(max_size)
  Array.new(max_size) do |i|
    if i != 0
      0.5*i*(i+1)
    end
  end
end
