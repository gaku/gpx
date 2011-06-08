require 'gpx/point'

module GPX
  class GeoPoint < Point
    alias :lat :y
    alias :lat= :y=
    alias :lon :x
    alias :lon= :x=
    
    def initialize(lat, lon)
      super(lon, lat)
    end
  end
end
