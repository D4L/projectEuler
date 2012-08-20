public

def httq
  initialTotal = 0
  finalTotal = 0
  File.open("src/problem-89/roman").each do |line|
    initialTotal += line.chop!.size
    finalTotal += RomanNumeral::RomanNumeral.new(line).to_s.size
  end
  initialTotal - finalTotal
end
