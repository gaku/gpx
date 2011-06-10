require 'test_helper'

require 'gpx/geopoint'
require 'gpx/distance'

class TestDistance < Test::Unit::TestCase
  def test_distance
    # the following page has similar code.  Took their example
    # http://www.esawdust.com/blog/gps/files/HaversineFormulaInRuby.html
    a = GPX::GeoPoint.new(39.06546, -104.88544)
    b = GPX::GeoPoint.new(39.06546, -104.80)
    assert_in_delta(7.376, GPX::Distance.distance(a, b), 0.001)
  end

  def test_distance2
    # Test against an example in the following page: 5837km
    # http://janmatuschek.de/LatitudeLongitudeBoundingCoordinates
    a = GPX::GeoPoint.new(40.6892, -74.0444)
    b = GPX::GeoPoint.new(48.8583, 2.2945)
    assert_in_delta(5837, GPX::Distance.distance(a, b), 1.0)
  end
end
