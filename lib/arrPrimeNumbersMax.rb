public

# Returns an array of prime numbers based on sieve of erosthantheses
def arrPrimeNumbersMax i
  result = Array.new(i - 2) {|i| i + 2}
  result.each do |k|
    numberToDelete = k * 2
    while numberToDelete < i
      result.delete numberToDelete
      numberToDelete += k
    end
  end
end
