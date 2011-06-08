require 'gpx/line'
module GPX
  class DouglasPeucker
    def initialize(original_points, tolerance)
      @original_points = original_points
      @tolerance_squared = tolerance * tolerance
      @output = {}
    end

    def simplify
      @output = {}
      # begining and ending points are always kept
      @output[0] = true
      @output[@original_points.length - 1] = true

      douglas_peucker(0, @original_points.length - 1, 0)

      outputs = []
      @output.keys.sort.each do |idx|
        outputs << @original_points[idx]
      end
      return outputs
    end

    def douglas_peucker(start_vertex_index, end_vertex_index, depth)
      # puts "[#{depth}] douglas_peucker(#{start_vertex_index}, #{end_vertex_index})"
      return if end_vertex_index <= (start_vertex_index + 1) # nothing to do.

      # make line from start to end
      line = Line.new(@original_points[start_vertex_index], @original_points[end_vertex_index])

      # find largest distance from intermediate points to this line
      max_dist_to_line_squared = 0
      max_point_index = nil

      (start_vertex_index..end_vertex_index).each do |index|
        point = @original_points[index]
        dist_to_line_squared = line.distance_to_point_squared(point)
        if (dist_to_line_squared > max_dist_to_line_squared)
          max_dist_to_line_squared = dist_to_line_squared
          max_point_index = index
        end
      end

      if max_dist_to_line_squared > @tolerance_squared
        # keep this point for output
        @output[max_point_index] = true
        # split the polyline at the farthest vertex
	# puts "add #{max_point_index}"

        douglas_peucker(start_vertex_index, max_point_index, depth+1)
        douglas_peucker(max_point_index, end_vertex_index, depth+1)
      end
    end
  end
end

