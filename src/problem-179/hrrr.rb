public

def hrrr
  count = 0
  seive = Array.new(10000001){|i| i = 0}
  (2..10000000).each do |n|
    i = n
    begin
      seive[i] += 1
      i += n
    end while i < 10000000
    count += 1 if seive[n] == seive[n-1]
  end
  count
end
