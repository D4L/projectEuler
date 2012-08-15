public

def ztvj
  result = 0
  number_length = [0, 3, 3, 5, 4, 4, 3, 5, 5, 4]
  tens_length = [0, 3, 6, 6, 5, 5, 5, 7, 6, 6]
  teen_length = [0, 6, 6, 8, 8, 7, 7, 9, 8, 8]
  (1..1000).each do |i|
    if i >= 1000
      result += 3 # for the one
      result += 8 # for the thousand
    else
      if i >= 100
        result += number_length[i/100] # for the (___) hundred
        result += 7 # for the hundred
        result += 3 if ((i %= 100) > 0) # for the and
      end
      if i >= 20 or i <= 10
        result += tens_length[i / 10] # for the (___)ty
        result += number_length[i % 10] # for the ones
      else
        result += teen_length[i - 10] #for the teen
      end
    end
  end
  result
end
