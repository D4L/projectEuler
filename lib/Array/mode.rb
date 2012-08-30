public

class Array
  def mode
    freq = inject(Hash.new(0)) {|h,v| h[v] += 1; h}
    max = freq.values.max
    freq.select {|k, f| f == max }
  end
end
