public

# let's start off with this... let b be the total number of balls and a be the number of blue balls
# now.. a*(a-1)/b*(b-1) = 1/2 => 2a^2 - 2a = b^2 - b
# => 2a^2 - 2a - b^2 + b = 0
# quadratic equation => a = 1/2 + sqrt(1 + 2b^2 - 2b)/2
# now.. this means 1 + 2b^2 - 2b must be a perfect square number
# so essentially, we must look for the first b > 10^12 that fits this

def zrdo

  # we seed a good b and keep estimating up
  b = 120
  prevb = 21

  calcb = 0
  while prevb < 10 ** 12 do

    # this part will find us the next good b
    calcb = Math.sqrt(1 + 2 * b ** 2 - 2 * b)
    while calcb.round != calcb do
      b += 1
      calcb = Math.sqrt(1 + 2 * b ** 2 - 2 * b)
    end

    c = b
    # this is our estimation phase... since b / prevb
    # approaches a limit, i think it is quite accurate
    b = (b**2 / prevb.to_f).floor
    prevb = c
    # prevb directly correlates to calcb at this point,
    # that is why we have while prevb < 10**12
  end
  1/2.0 + calcb / 2.0
end
