public

def ccqa
  result = 0
  numRepeatingDigits(21)
=begin
  (1..999).each do |i|
    divident = 1
    arr = Array.new
    while
      while divident / i < 0
        divident *= 10
      end
    end
  end
=end
  result
end

private
def numRepeatingDigits n
  divident = 1
  arr = Array.new
  (1..10).each do
    divident *= 10
    while divident / n <= 0
      divident *= 10
      arr.push 0
    end
    arr.push divident / n
    divident %= n
    break if divident == 0
  end
end
