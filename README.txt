= HkGeo

A Geo location conversion API for HK

== Dependency

* mechanize
* hoe (build)

== Usage

By default, convert the HK80 location to WGS84/ITRF96

 require 'hk_geo'
 result = HkGeo::Converter.convert("835352.749", "815640.774")
 >> ["22.457521648", "113.976469709"]
 
You may specify other conversion

 require 'hk_geo'
 result = HkGeo::Converter.convert("835352.749", "815640.774", HkGeo::SYSTEM_HK80, HkGeo::SYSTEM_ITRF96, HkGeo::UNIT_DM)
 >> ["22.2745130", "113.5858818"]
 
Check the test for more info.

== Credit

This api rely on the online conversion tool from Survey and Mapping Office. http://www.geodetic.gov.hk/smo/tform/tra_tform.aspx

