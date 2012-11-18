public

def wumk
  names = File.open("src/problem-22/names").readline
  names = names.split ','
  names.map {|name| name.tr!('"', '')}
  names.sort!
  result = 0
  multiplier = 0
  names.each do |name|
    multiplier += 1
    name.bytes do |b|
      result += multiplier * ( b - 64 )
    end
  end
  result
end
