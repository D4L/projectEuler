public

def mkti
  daysInMonth = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30 ,31 ]
  daysum = 0
  result = 0
  100.times do |year|
    daysInMonth.each do |month|
      daysum += month

      # for leap years
      daysum += 1 if year % 4 == 0 && month == 29

      # special centenium rule!
      daysum -= 1 if year == 100

      # first day is a monday, add the number of days.. we want 5?
      result += 1 if daysum % 7 == 5
    end
  end
  result
end
