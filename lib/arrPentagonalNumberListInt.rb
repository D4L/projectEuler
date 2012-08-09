public

# Creates an array of pentagonal numbers based on the formula
# Pn = n(3n-1)/2
# Returns all pentagonal numbers all the way up to n
def arrPentagonalNumberListInt n
  Array.new(n) {|i| (i + 1) * (3 * (i + 1) - 1) / 2}
end
