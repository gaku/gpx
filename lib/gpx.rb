require 'rubygems'
require 'nokogiri'
require 'gpx/geopoint'
require 'gpx/time'

module GPX
  class GpxFile
    attr_accessor :points
    def initialize(filepath)
      @filepath = filepath
      @points = nil
    end

    # parse gpx file and produce an array of GeoPoints.
    # TODO: it ignores segments.  Not good.
    def parse_file
      xml = Nokogiri::XML(open(@filepath))
      track_points = xml.xpath('//xmlns:trkpt')
      @points = track_points.map do |trkpt|
        GeoPoint.new(trkpt.xpath('@lat').to_s.to_f, trkpt.xpath('@lon').to_s.to_f)
      end
    end
  end
end
