public

# same as fibGetSingle except we don't use Math module. should be faster
def fibGetSingle2 (n)
  (1.61803398875 ** n - -0.61803398875 ** n) / 2.2360679775
end
