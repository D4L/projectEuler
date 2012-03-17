public

def oomk
  # we need to satisfy a + b + c = 1000 and
  # a ^ 2 + b ^ 2 = c ^ 2
  # c = 1000 - a - b
  # a ^ 2 + b ^ 2 = (1000 - a - b) ^ 2
  # a ^ 2 + b ^ 2 = (1000 - a - b) * (1000 - a - b)
  # a^2 + b^2 = 1000000 - 1000a - 1000b - 1000a + a^2 + ab - 1000b + ab + b^2
  # 0 = 1000000 - 2000a - 2000b + 2ab
  # 0 = 500000 - 1000a - 1000b + ab
  # solving this should suffice
  (1..1000).each do |a|
    (1..(1000-a)).each do |b|
      if 0 == 500000 - 1000 * a - 1000 * b + a * b
        return a * b * (1000 - a - b)
      end
    end
  end
end
