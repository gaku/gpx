require 'test_helper'
require 'gpx/geopoint'

class TestGeoPoint < Test::Unit::TestCase
  def test_lat_lng
    p = GPX::GeoPoint.new(38, -135)
    assert_equal(38, p.lat)
    assert_equal(-135, p.lon)

    p.lat = 39
    assert_equal(39, p.lat)
    assert_equal(39, p.y)
  end
end
