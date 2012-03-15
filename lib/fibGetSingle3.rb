public

#same as fibGetSingle except we do a loop te grab the elements
def fibGetSingle3 (n)
  i, j = 0, 1
  (2 .. n).each do
    i, j = j, i + j
  end
  j
end
