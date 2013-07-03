require "bundler/gem_tasks"
require 'rubygems'

$: << 'lib'
require './lib/hk_geo'
require './lib/tasks/route_finder'

Gem::Specification.new do |s|  
  s.name        = "hk_geo"  
  s.version     = HkGeo::VERSION  
  s.platform    = Gem::Platform::RUBY  
  s.authors     = ["Francis Chong"]  
  s.email       = ["Tfrancis@ignition.hk"]  
  s.homepage    = "https://github.com/siuying/hk_geo"  
  s.summary     = %q{geolocation transormation api for hk.}  
  s.description  = %q{geolocation transormation api for hk.}
  s.license       = "MIT"

  s.add_dependency "mechanize"
  s.add_dependency "rest-client"
  s.add_dependency "json"
  s.add_dependency "nayutaya-googlemaps-polyline"

  s.files         = `git ls-files`.split("\n")  
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")  
  s.executables   = `git ls-files -- bin/*`.split("\n").map{  |f| File.basename(f) }  
  s.require_paths = ["lib"]  
end  