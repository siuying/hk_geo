# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hk_geo/version'

Gem::Specification.new do |spec|
  spec.name          = "hk_geo"
  spec.version       = HkGeo::VERSION
  spec.authors     = ["Francis Chong"]  
  spec.email       = ["Tfrancis@ignition.hk"]  
  spec.homepage    = "https://github.com/siuying/hk_geo"  
  spec.summary     = %q{geolocation transormation api for hk.}  
  spec.description  = %q{geolocation transormation api for hk.}
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "mechanize"
  spec.add_dependency "rest-client"
  spec.add_dependency "json"
  spec.add_dependency "nayutaya-googlemaps-polyline"
end
