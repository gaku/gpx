require 'test_helper'
require 'date'
require 'gpx/time'

class TimeTest < Test::Unit::TestCase
  def test_parse
    input = "2011-05-06T23:13:14Z"    
    t = GPX::Time::Parse(input)
    assert_equal 2011, t.year
    assert_equal 5, t.month
    assert_equal 6, t.day
    assert_equal 23, t.hour
    assert_equal 13, t.min
    assert_equal 14, t.sec
    assert_equal 0, t.utc_offset
  end
end
