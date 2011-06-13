module GPX
  class Time
    def self.Parse(time_string)
      dt = DateTime.strptime(time_string, '%Y-%m-%dT%H:%M:%SZ')
      ::Time.utc(dt.year, dt.month, dt.day, dt.hour, dt.min, dt.sec)
    end
  end
end
