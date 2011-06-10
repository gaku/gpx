# compute distance between two points on Earth.
require 'gpx/geopoint'
require 'gpx/distance'

a = GPX::GeoPoint.new(39.06546, -104.88544)
b = GPX::GeoPoint.new(39.06546, -104.80)

puts GPX::Distance.distance(a, b)
