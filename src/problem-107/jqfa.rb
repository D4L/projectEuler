public

# I'm trying to get the bare necessities and then add the bridges between them
def jqfa
  counter = 1
  matrix = Jqfa1.new
  File.open("src/problem-107/network").each do |i|
    line = i.strip.split(',')
    (counter..39).each do |i|
      matrix.push Jqfa2.new(line[i].to_i, counter, i + 1) if line[i] != "-" and line[i] != "116"
    end
    counter += 1
  end
  matrix.minimize
  p matrix.edges.count
  matrix.total
end

class Jqfa1 # this represents the entire matrix
  attr_accessor :edges
  def initialize *a
    if a.count == 1
      @edges = Array.new(a[0].edges)
    else
      @edges = Array.new
    end
  end
  def push i
    @edges.push i
  end
  def pop
    @edges.pop
  end
  def delete i
    @edges.delete i
  end
  def connected? # try to not use here
    temp = Array.new
    group = Array.new([@edges.first.loc1])
    while temp.size != group.size
      group.each do |i|
        temp += connected_to_vertex i
      end
      temp.uniq!
      temp, group = group, temp
      bipartite_test = Array.new
      group.each do |i|
        bipartite_test += connected_to_vertex i
      end
      bipartite_test.uniq!
      break if temp.size == bipartite_test.size
    end
    temp.count == 40
  end
  def connected2? # this one just checks that all 40 are there
    (@edges.collect {|i| i.loc1} + @edges.collect{|i| i.loc2}).uniq.count == 40
  end
  def total
    @edges.collect{|i| i.value}.inject(&:+)
  end
  def connected_points? (i,j)
    if connected_to_vertex(i).include? j
      return @edges.find {|e| (e.loc1 == i and e.loc2 == j) or (e.loc2 == i and e.loc1 == j)}
    end
  end
  def minimize
    # successively delete the largest element and ensure it's still connected
    @edges.sort!{|i,k| i.value <=> k.value}.reverse!
    temp = Jqfa1.new(self)
    @edges.each do |e|
      tempedge = temp.delete e
      if not temp.connected2?
        temp.push tempedge
      end
    end
    @edges = temp.edges
  end
  def connected_to_vertex i # where i is the point
    result = Array.new
    @edges.each do |j|
      if j.loc1 == i
        result.push j.loc2
      elsif j.loc2 == i
        result.push j.loc1
      end
    end
    result.uniq
  end
end

class Jqfa2 # this is each edge
  attr_accessor :value, :loc1, :loc2
  def initialize(i, j, k)
    @value = i
    @loc1 = j
    @loc2 = k
  end
end
