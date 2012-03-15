public

def aeia
  result = 0
  i, j = 1, 2
  while j < 4000000
    result += j if j % 2 == 0
    i, j = j, i + j
  end
  result
end
