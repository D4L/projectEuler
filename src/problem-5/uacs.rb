public

def uacs
  # 1 * 2 * 3 * 4 * 5 * 6 * 7 * 8 * 9 * 10 * 11 * 12 * 13 * 14 * 15 * 16 * 17 * 18 * 19 * 20
  # is the naive large one, to get smaller ones, we must break them to their prime factors
  # 1 * 2 * 3 * (2 * 2) * 5 * (3 * 2) * 7 * (2 * 2 * 2) * (3 * 3) * (5 * 2) * 11 * (3 * 2 * 2) * 13 * (7 * 2) * (5 * 3) * (2 * 2 * 2 * 2) * 17 * (3 * 3 * 2) * 19 * (2 * 2 * 5)
  # 1 * 2 * 3 * (2 * 2) (already have a 2, so we can cancel one of these, need the other one) * 5
  # 1 * 2 * 3 * 2 * 5 * (3 * 2) (both 3 and 2 already exist, cancel them both)
  # 1 * 2 * 3 * 2 * 5 * 7 * (2 * 2 * 2) (already have 2 twos, keep only one)
  # 1 * 2 * 3 * 2 * 5 * 7 * 2 * (3 * 3) (keep one of the 3s screw the other one)
  # 1 * 2 * 3 * 2 * 5 * 7 * 2 * 3 * 11 * 13 * 2 * 17 * 19 (went ahead and did the work)
  1 * 2 * 3 * 2 * 5 * 7 * 2 * 3 * 11 * 13 * 2 * 17 * 19
end
