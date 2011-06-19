require 'test_helper'
require 'gpx/file'

class GPXFileTest < Test::Unit::TestCase
  def test_initialize_dump
    gpx = GPX::File.new('data/sample.gpx')
    assert_equal("Current Track: 06 JUN 2011 16:13", gpx.dump.css('trk name').text)
  end

  def test_process_trkseg
    gpx = GPX::File.new('data/sample.gpx')
    count = 0
    gpx.process_trkseg { |trkseg| count += 1 }
    assert_equal(1, count)
  end

  def test_process_trkseg
    gpx = GPX::File.new('data/sample.gpx')
    count = 0
    gpx.process_trk { |trk| count += 1 }
    assert_equal(1, count)
  end
end
