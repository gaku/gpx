module GPX
  class Point
    attr_accessor :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def to_s
      "(#{x},#{y})"
    end

    def ==(other)
      return true if @x == other.x and @y == other.y
      return false
    end
  end
end
