# -*- ruby -*-
Gem::Specification.new do |s|
  s.name = "gpx"
  s.version = "0.0.1"
  s.summary = "GPX manupiration library"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
