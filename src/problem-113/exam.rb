public

def exam
  result = Array.new(10) {|i| i = 1}
  randomBouncies = 0
  (2..100).each do # this is the number of 0s we're stacking together
    result[0] = result[0] + result[1] + result[2] + result[3] + result[4] + result[5] + result[6] + result[7] + result[8] + result[9]
    randomBouncies += result[0] - 10
    result[1] = result[1] + result[2] + result[3] + result[4] + result[5] + result[6] + result[7] + result[8] + result[9]
    result[2] = result[2] + result[3] + result[4] + result[5] + result[6] + result[7] + result[8] + result[9]
    result[3] = result[3] + result[4] + result[5] + result[6] + result[7] + result[8] + result[9]
    result[4] = result[4] + result[5] + result[6] + result[7] + result[8] + result[9]
    result[5] = result[5] + result[6] + result[7] + result[8] + result[9]
    result[6] = result[6] + result[7] + result[8] + result[9]
    result[7] = result[7] + result[8] + result[9]
    result[8] = result[8] + result[9]
  end
  2 * result.inject(&:+) - 10 + randomBouncies - 1
end
