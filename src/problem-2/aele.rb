public

def aele
  #same as aecy except we use fibGetSingle2 instead!
  result, i = 0, 3
  while (j = fibGetSingle2(i)) < 4000000
    result += j
    i += 3
  end
  result.to_i
end
