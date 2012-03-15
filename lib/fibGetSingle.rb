public

# ((1 + sqrt(5))/2)^n - ((1 - sqrt(5))/2)^n / sqrt(5)
def fibGetSingle (n)
  (((1.0 + Math.sqrt(5)) / 2.0) ** n - ((1.0 - Math.sqrt(5)) / 2.0) ** n) / Math.sqrt(5)
end
