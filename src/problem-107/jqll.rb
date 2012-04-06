public

# We're gna build our own matrix now! yay, so build and remove old shit
def jqll
  counter = 1
  matrix = Jqll1.new
  File.open("src/problem-107/network").each do |i|
    line = i.strip.split(',')
    (counter..39).each do |i|
      matrix.push Jqll2.new(line[i].to_i, counter, i + 1) if line[i] != "-"
    end
    counter += 1
  end
  result = matrix.total
  matrix.minimize
  result -= matrix.total
end

class Jqll1 # this represents the entire matrix
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
  def total
    @edges.collect{|i| i.value}.inject(&:+)
  end
  def connected2? # this one just checks that all 40 are there
    (@edges.collect {|i| i.loc1} + @edges.collect{|i| i.loc2}).uniq.count == 40
  end
  def connected_points? (i,j)
    if connected_to_vertex(i).include? j
      return @edges.find {|e| (e.loc1 == i and e.loc2 == j) or (e.loc2 == i and e.loc1 == j)}
    end
  end
  def minimize
    @edges.sort!{|i,k| i.value <=> k.value}
    buildUp = Array.new([@edges[0]])
    containsPoints = Array.new([@edges[0].loc1, @edges[0].loc2])
    delete_intertwining containsPoints
    while not @edges.empty?
      addEdge = @edges.find {|e| containsPoints.include? e.loc1 or containsPoints.include? e.loc2}
      buildUp.push addEdge
      containsPoints.push addEdge.loc1
      containsPoints.push addEdge.loc2
      containsPoints.uniq!
      delete_intertwining containsPoints
    end
    @edges = buildUp
  end
  def delete_intertwining i # where i is an array of points
    todelete = Array.new
    @edges.each do |e|
      if i.include? e.loc1 and i.include? e.loc2
        todelete.push e
      end
    end
    todelete.each do |e|
      @edges.delete e
    end
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

class Jqll2 # this is each edge
  attr_accessor :value, :loc1, :loc2
  def initialize(i, j, k)
    @value = i
    @loc1 = j
    @loc2 = k
  end
end
