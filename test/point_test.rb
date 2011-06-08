require 'test_helper'
require 'gpx/point'

class PointTest < Test::Unit::TestCase
  def test_equals
    a = GPX::Point.new(1,2)
    b = GPX::Point.new(1,2)
    assert_equal(true, a == b)

    c = GPX::Point.new(1,3)
    assert_equal(false, a == c)
  end
end