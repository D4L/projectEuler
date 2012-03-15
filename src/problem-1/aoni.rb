public

def aoni
  result, i = 0, 1
  while i * 3 < 993
    result += (4 * i + 6) * 3
    i += 5
  end
  while i * 3 < 1000
    result += i * 3 if i % 5 != 0
    i += 1
  end
  i = 0
  while i * 5 < 1000
    result += (5 * i + 10) * 5
    i += 5
  end
  result
end
