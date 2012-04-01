public

def lmtf
  result = 0
  total = (6**6.0)*(4**9)
  (6..36).each do |i|
    # we need to multiply numOfA by numOfI
    # S = (x + x^2 + x^3 + x^4 + x^5 + x^6)^6
    # S = x^6(1 + x + x^2 + x^3 + x^4 + x^5)^6
    # 1-x^6/1-x = 1 + x + x^2 + x^3 + x^4 + x^5
    # S = (1-x^6)^6 (1-x)^-6
    # num of possibilities = sum of k = 0 to floor(i-6)/6 6 choose k * (i-1-6*k) choose 5 * (-1)^k

    numOfI = 0
    (0..((i-6)/6.0).floor).each do |k|
      numOfI += (-1)**k * intChooseInts(6,k) * intChooseInts(i-1-6*k,5)
    end

    ((i+1)..36).each do |a|
      # this is only the places where peter beats colin
      # we can count the number of times this happens
      # S = (x + x^2 + x^3 x^4)^9
      # S = x^9(1 + x + x^2 + x^3)^9
      # question becomes what's coefficient of (a - 9)
      # 1 / 1-x = 1 + x + x^2 + x^3 + x^4
      # 1-x^4 / 1-x = 1 + x + x^2 + x^3
      # S = (1-x^4)^9 (1-x)^-9
      # S = (1+x^2)^9 (1+x)^9 (1-x)^9 (1-x)^-9
      # S = (1+x^2)^9 (1+x)^9
      # binomial series: (1 + x)^n = sum of k = 0 to infinity of n choose k * x ^ k
      # nega bi series: (1 - x)^-n = sum of k = 0 to infinity of (k + n - 1) choose k * x ^ k
      # thus for a given coefficient a, the number of possibilities is
      # [x^a] S = [x^(a-9)] (1+x^2)^9 (1+x)^9
      #         = [x^(a-9)] sum of k = 0 to infinity of 9 choose k * x ^ 2k * sum of i = 0 to infinity of 9 choose i * x ^ i
      # num of possibilites  = sum of k = 0 to floor(a-9)/2 9 choose k * 9 choose (a-9-2k)
      numOfA = 0
      (0..((a-9)/2.0).floor).each do |k|
        numOfA += intChooseInts(9, k) * intChooseInts(9, a-9-2*k)
      end
      result += numOfI * numOfA
    end
  end
  (result/total).round(7)
end
