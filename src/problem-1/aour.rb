public

def aour
  result = 0
  999.downto(1) do |i|
    result += i if i % 5 == 0 or i % 3 == 0
  end
  result
end
