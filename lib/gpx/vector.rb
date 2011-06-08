module GPX
  class Vector
    attr_accessor :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def dot_product(v)
      return @x * v.x + @y * v.y
    end 

    def magnitude
      return Math.sqrt(@x * @x + @y * @y)
    end

    def unit_vector
      if magnitude == 0
        return Vector.new(0,0)
      end
      return Vector.new(@x / magnitude, @y / magnitude)
    end
  end
end
