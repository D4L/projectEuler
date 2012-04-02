public

def exwv
  result = 0
  (1..999).each do |i|
    # except this is slow as shit, lets figure out another one
    if not boolIsBouncyInt i
      result += 1
    end
  end
  result
end
