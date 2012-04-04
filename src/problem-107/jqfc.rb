public

# I'm trying to get the bare necessities and then add the bridges between them
def jqfc
  counter = 1
  matrix = Jqfc1.new
  File.open("src/problem-107/network").each do |i|
    line = i.strip.split(',')
    (counter..39).each do |i|
      matrix.push Jqfc2.new(line[i].to_i, counter, i + 1) if line[i] != "-" and line[i] != "116"
    end
    counter += 1
  end
  matrix.minimize
  p matrix.edges.count
  matrix.total
end

class Jqfc1 # this represents the entire matrix
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
    @edges.sort!{|i,k| i.value <=> k.value}
    buildUp = Array.new([@edges.first])
    containsPoints = Array.new([@edges.first.loc1, @edges.first.loc2])
    delete_intertwining containsPoints
    while not @edges.empty?
      buildUp.push @edges.first
      containsPoints.push @edges.first.loc1
      containsPoints.push @edges.first.loc2
      containsPoints.uniq!
      delete_intertwining containsPoints
    end
    @edges = buildUp
  end
  def discover_local_group i # i must be a point
    result = Array.new([i])
    temp = Array.new
    begin
      result += temp
      result.each do |l|
        temp += connected_to_vertex l
      end
      temp.uniq!
      temp -= result
    end while temp != []
    result.uniq!
    result
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

class Jqfc2 # this is each edge
  attr_accessor :value, :loc1, :loc2
  def initialize(i, j, k)
    @value = i
    @loc1 = j
    @loc2 = k
  end
end
