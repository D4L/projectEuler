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
  matrix.minimize
  p matrix.edges.size
  matrix.total
end

class Jqew1 # this represents the entire matrix
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
  def connected?
    temp = Array.new
    group = Array.new([@edges.first.loc1])
    while temp.size != group.size
      group.each do |i|
        temp += connected_to_vertex i
      end
      group += temp
      temp.uniq!
      group.uniq!
      temp, group = group, temp
      #bipartite_test = Array.new
      #group.each do |i|
      #  bipartite_test += connected_to_vertex i
      #end
      #bipartite_test.uniq!
      #break if temp.size == bipartite_test.size
    end
    temp.count == 40
  end
  def total
    @edges.collect{|i| i.value}.inject(&:+)
  end
  def minimize
    # successively delete the largest element and ensure it's still connected
    @edges.sort!{|i,k| i.value <=> k.value}.reverse!
    temp = Jqew1.new(self)
    @edges.each do |e|
      tempedge = temp.delete e
      if not temp.connected?
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

class Jqew2 # this is each edge
  attr_accessor :value, :loc1, :loc2
  def initialize(i, j, k)
    @value = i
    @loc1 = j
    @loc2 = k
  end
end
