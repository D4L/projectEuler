public

# returns something like this, 12 => [[2, 2], [3, 1]]
# to indicate 12 = 2 ** 2 * 3 ** 1
def arrPrimeFactorizationInt n
  result = []
  i = 2
  k = 0
  while n != 1
    if n % i == 0
      k += 1
      n /= i
      next;
    end
    result.push [i, k] if k != 0
    i += 1
    k = 0
  end
  result.push [i, k]
  result
end
