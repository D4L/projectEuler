public

# I'm trying to get the bare necessities and then add the bridges between them
def jqfa
  counter = 1
  matrix = Jqfa1.new
  File.open("src/problem-107/network").each do |i|
    line = i.strip.split(',')
    (counter..39).each do |i|
      matrix.push Jqfa2.new(line[i].to_i, counter, i + 1) if line[i] != "-"
    end
    counter += 1
  end
  result = matrix.total
  matrix.minimize
  matrix.edges.count
  result -= matrix.total
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
  def connected3?
    temp = Array.new
    group = Array.new([1])
    begin
      group += temp
      group.each do |i|
        temp += connected_to_vertex i
      end
      temp.uniq!
      temp -= group
    end while temp != []
    group.count == 40
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
    @edges.sort!{|i,k| i.value <=> k.value}.reverse!
    temp = Jqfa1.new(self)
    @edges.each do |e|
      tempedge = temp.delete e
      if not temp.connected2?
        temp.push tempedge
      end
    end
    # we store the full matrix away, and make edges the official one
    existing_trees = Array.new
    (1..40).each do |i|
      if not existing_trees.find {|k| k.include? i}
        existing_trees.push temp.discover_local_group i
      end
    end
    @edges.reverse!
    while not temp.connected3?
      # get the lowest edge between all the trees
      # add that edge to edges and combine the two trees
      existing_trees.each do |i|
        delete_intertwining i
      end
      edgeToAdd = @edges.first
      tree1 = existing_trees.find{|i| i.include? edgeToAdd.loc1}
      tree2 = existing_trees.find{|i| i.include? edgeToAdd.loc2}
      temp.push edgeToAdd
      existing_trees.delete tree1
      existing_trees.delete tree2
      existing_trees.push (tree1+tree2)
    end
    @edges = temp.edges
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

class Jqfa2 # this is each edge
  attr_accessor :value, :loc1, :loc2
  def initialize(i, j, k)
    @value = i
    @loc1 = j
    @loc2 = k
  end
end
