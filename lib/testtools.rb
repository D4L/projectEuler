def gettime(program, *params)
  result = Array.new
  timestart = Time.now
  ret = program.call nil
  timeend = Time.now - timestart
  if not params.empty?
    return Array.new(2) {|i| (i == 0 ? timeend : ret)}
  end
  timeend
end

def getRanChar
    ((Random.rand * 25 + 97).round).chr
end
