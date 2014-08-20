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

  def color_pixel(x, y, color)
    grid[x.to_i][y.to_i] = color
  end

  def vertical_color(column, from, to, color)
    column, from, to = column.to_i, from.to_i, to.to_i
    raise(ArgumentError, "#{from} can't be bigger than #{to}") if from > to

    (from..to).each {|n| grid[n][column] = color }
  end
end