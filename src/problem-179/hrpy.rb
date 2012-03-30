public

def hrpy
  result = 0
  dis = 0
  nex = 0
  (1..10000000).each do |i|
    p i
    if i % 2 == 0
      dis = 0
      (1..Math.sqrt(i)).each do |n|
        if i % n == 0
          dis += 2
        end
      end
      dis -= 1 if Math.sqrt(i).round ** 2 == i
    else
      nex = 0
      (1..Math.sqrt(i)).each do |n|
        if i % n == 0
          nex += 2
        end
      end
      nex -= 1 if Math.sqrt(i).round ** 2 == i
    end
    result += 1 if dis == nex
  end
  result
end
