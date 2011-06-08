require 'gpx/vector'
module GPX
  class Line
    def initialize(p1, p2)
      @p1 = p1
      @p2 = p2
    end

    def length_squared
      dx = @p1.x - @p2.x
      dy = @p1.y - @p2.y
      return dx * dx + dy * dy
    end

    def distance_to_point_squared(point)
      # compute dot product between v and l
      v = Vector.new(point.x - @p1.x, point.y - @p1.y)
      l = Vector.new(@p2.x - @p1.x, @p2.y - @p1.y)
      dot = v.dot_product(l.unit_vector)

      # TODO need to understand the followings

      # outside of p1
      if (dot <= 0)
        dl = Line.new(@p1, point)
        return dl.length_squared
      end

      # outside of p2
      if (dot * dot) > length_squared
        dl = Line.new(@p2, point)
        return dl.length_squared
      end

      # regular cases
      v2 = Line.new(@p1, point)
      h = v2.length_squared
      return h - (dot * dot)
    end
  end
end
