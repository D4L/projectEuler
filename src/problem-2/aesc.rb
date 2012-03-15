public

def aesc
  result, i = 0, 3
  while (j = fibGetSingle3(i)) < 4000000
    result += j
    i += 3
  end
  result
end
