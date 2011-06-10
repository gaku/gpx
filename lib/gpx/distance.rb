module GPX
  module Distance
    Rkm = 6371 # Earth radius in km
    RADIAN_PER_DEGREE = Math::PI / 180.0

    def distance(p1, p2)
      # deltas
      dlat = (p1.lat - p2.lat) * RADIAN_PER_DEGREE
      dlon = (p1.lon - p2.lon) * RADIAN_PER_DEGREE

      # compute distance using Haversine distance formula
      # http://en.wikipedia.org/wiki/Great-circle_distance

      return Rkm * 2.0 * Math.asin(Math.sqrt(Math.sin(dlat / 2.0) * Math.sin(dlat / 2.0) + Math.cos(p1.lat * RADIAN_PER_DEGREE) * Math.cos(p2.lat * RADIAN_PER_DEGREE) * Math.sin(dlon / 2) * Math.sin(dlon / 2)))
    end
    module_function :distance
  end
end
