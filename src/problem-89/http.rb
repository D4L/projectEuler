public

def http
  # note this is the cool lazy way but it's really impractical
  initialTotal, finalTotal = 0, 0
  File.open("src/problem-89/roman").each do |line|
    initialTotal += line.chop!.size
    finalTotal += RomanNumeral::RomanNumeral.new(line).to_scool.size
  end
  initialTotal - finalTotal
end
