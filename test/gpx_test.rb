require 'test_helper'
require 'gpx'

class GpxTest < Test::Unit::TestCase
  def test_parse_file
    gpx = GPX::GpxFile.new('data/sample.gpx')
    gpx.parse_file
  end
end
