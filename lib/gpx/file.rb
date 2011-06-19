require 'nokogiri'

module GPX
  class File
    def initialize(file)
      @xml = Nokogiri::XML(open(file))
    end

    def process_trkseg(&block)
      trksegs = @xml.css('trkseg')
      trksegs.each do |trkseg|
        yield trkseg
      end
    end

    def process_trk(&block)
      trk = @xml.css('trk')
      trk.each do |trk|
        yield trk
      end
    end

    def dump
      @xml
    end
  end
end
