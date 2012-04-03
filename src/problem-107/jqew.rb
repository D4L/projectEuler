public

def jqew
  counter = 1
  matrix = Jqew1.new
  File.open("src/problem-107/network").each do |i|
    line = i.strip.split(',')
    (counter..39).each do |i|
      matrix.push Jqew2.new(line[i].to_i, counter, i + 1) if line[i] != "-"
    end
    counter += 1
  end
  minimal = matrix.minimize
  minimal.total
end

class Jqew1 # this represents the entire matrix
  def initialize
    @edges = Array.new
  end
  def push i
    @edges.push i
  end
  def connected?
    (@edges.collect {|i| i.loc1} + @edges.collect {|i| i.loc2}).uniq == Array.new(40) {|i| i+1}
  end
  def total
    @edges.collect{|i| i.value}.inject(&:+)
  end
  def minimize
    result = Jqew1.new
    @edges.sort!{|i,k| i.value <=> k.value}
    result
  end
end

class Jqew2 # this is each edge
  attr_accessor :value, :loc1, :loc2
  def initialize(i, j, k)
    @value = i
    @loc1 = j
    @loc2 = k
  end
end
