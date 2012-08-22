public

# let's find the probability of one turn first
# 1: need to win 1/1, there are 2 disks 1/2
# 2: need to win 2/2, so that's all, first time it's 1/2, second time 1/3.
#    winning is 1/6
# 3: need to win 2/3, or 3/3
#    the chances of pulling 3 is 1/2 * 1/3 * 1/4
#    the chances of pulling 2 is 1/2 * 1/3 * 3/4 + 1/2 * 2/3 * 1/4 + 1/2 * 1/3 * 1/4
#    thus winning is 1/24 + 3/24 + 1/24 + 2/24 = 7/24
# 4: need to win 3/4, or 4/4
#    the chances of pulling 4 is 1/2 * 1/3 * 1/4 * 1/5
#    the chances of pulling 3 is 1/2 * 1/3 * 1/4 * 4/5 + 1/2 * 1/3 * 3/4 * 1/5 +
#                                1/2 * 2/3 * 1/4 * 1/5 + 1/2 * 1/3 * 1/4 * 1/5
#    thus winning is (1 + 4 + 3 + 2 + 1)/120 = 11/120
# 5: need to win 3,4,5
#    the chances of pulling 5 is 1/2 * 1/3 * 1/4 * 1/5 * 1/6
#    the chances of pulling 4 is 1/2 * 1/3 * 1/4 * 1/5 * 5/6 +
#                                1/2 * 1/3 * 1/4 * 4/5 * 1/6 +
#                                ...
#    the chances of pulling 3 is 1/2 * 1/3 * 1/4 * 4/5 * 5/6 +
#                                1/2 * 1/3 * 3/4 * 1/5 * 5/6 +
#                                1/2 * 1/3 * 3/4 * 4/5 * 1/6 +
#                                ...
#    the sum is crazy...
#
# good luck

def powm
  probNum = 1
  numTurns = 15
  probDenom = (2..numTurns+1).inject(&:*)
  probPuller = Array.new(numTurns) {|i| i + 1}
  (1..(numTurns-1)/2).each do |i|
    probPuller.combination(i) do |f|
      probNum += f.inject(&:*)
    end
  end
  probDenom / probNum
end
