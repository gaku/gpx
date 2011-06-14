# filter gpx track points near specified location (such as home)
# filter distance 300m
# center lat/lon

require 'rubygems'
require 'optparse'
require 'nokogiri'
require 'gpx'

class GpxFile
  def initialize(file)
    puts "open:#{file}"
    @xml = Nokogiri::XML(open(file))
  end

  def process_trkseg(&block)
    trksegs = @xml.css('trkseg')
    trksegs.each do |trkseg|
      yield trkseg
    end
  end

  def dump
    @xml
  end
end


def main
  distance = 0.3 # km
  min_seconds = 60 * 5 # Minimum 5 minutes required

  ARGV.options { |opt|
    opt.on('-d DISTANCE', '--distance DISTANCE', 'distance in km') { |v| distance = v }
    opt.on('-m MINIMUM', '--minimum MINIMUM', 'minimum time in seconds') { |v| min_seconds = v.to_i }
    opt.parse!(ARGV)
  }

  if ARGV.length != 1
    puts 'specify a gpx file to process'
    exit 1
  end

  gpx = GpxFile.new(ARGV[0])
  gpx.process_trkseg do |trkseg|
    trkpts = trkseg.css('trkpt')
    start_t = GPX::Time::Parse(trkpts.first.css('time').text())
    finish_t = GPX::Time::Parse(trkpts.last.css('time').text())
    duration = finish_t - start_t
    if duration < min_seconds
      # pruning the trackseg.
      $stderr.puts "Removing a short trkseg (#{duration} secs)"
      trkseg.remove
    else
      $stderr.puts "Output a trkseg (#{duration} secs)"
    end
  end
  puts gpx.dump
end
main



