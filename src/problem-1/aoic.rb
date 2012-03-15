public

def aoic
  (1..999).to_a.inject(0) do |sum, i|
    sum += i if i % 5 == 0 or i % 3 == 0
    sum
  end
end
