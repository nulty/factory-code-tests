class Image

  attr_reader :grid

  def initialize(x,y)
    @x = x.to_i
    @y = y.to_i
    if @x.to_i < 1 || @x.to_i > 250 || @y.to_i < 1 || @y.to_i > 250
      raise(ArgumentError, "must be integer greater than 0 and lower than 250")
    end
    @grid = Array.new(@x) { Array.new(@y, 0) }
  end

  def print_image
    grid.each do |row|
      print row.join
      puts
    end
  end
end