class HashChained

  attr_accessor :hashMain

  def initialize( *args )
    @hashMain = Hash.new(*args)
  end

  def []( key )
    @hashMain[key]
  end

  def []=( key, value )
    if @hashMain[key].class == Array
      @hashMain[key] << value
    elsif @hashMain[key].class == NilClass
      @hashMain[key] = value
    else
      @hashMain[key] = [@hashMain[key]]
      @hashMain[key] << value
    end
  end

  def method_missing( m, *args, &block )
    @hashMain.send( m.to_sym, *args)
  end

end
