= HkGeo

== Description

A Geo location conversion API for HK.

== Dependency

* mechanize
* rest-client
* json
* nayutaya-googlemaps-polyline
* hoe (build)

== Install

 gem install hk_geo

== Usage

=== Conversion API

By default, convert the HK80 location to WGS84/ITRF96

 require 'hk_geo'
 result = HkGeo::Converter.convert("835352.749", "815640.774")
 >> ["22.457521648", "113.976469709"]
 
You may specify other conversion

 require 'hk_geo'
 result = HkGeo::Converter.convert("835352.749", "815640.774", HkGeo::SYSTEM_HK80, HkGeo::SYSTEM_ITRF96, HkGeo::UNIT_DM)
 >> ["22.2745130", "113.5858818"]
 
=== Route Finder API

Use two coordinate to find the route between

 data = HkGeo::RouteFinder.route("22.445663383,113.983328736", "22.444075388,113.984268260")
 >> [[22.44557, 113.98324, 3], [22.44487, 113.9839, 0], [22.4431, 113.98512, 1], [22.4424, 113.98548, 0], [22.44182, 113.98568, 0], [22.44122, 113.98581, 0], [22.44078, 113.98582, 1], [22.44044, 113.98581, 0], [22.43885, 113.98556, 0], [22.43727, 113.98526, 0], [22.43569, 113.98487, 1] ... (skipped)
 
== Rake Task

Find route in "Traffic Speed Map" from Hong Kong Government.

 rake route

Check the test for more info.

== Credit

The conversion api rely on the online conversion tool from Survey and Mapping Office. http://www.geodetic.gov.hk/smo/tform/tra_tform.aspx

The rake task originally from "Data Download for Traffic Speed Map" from GovHK Data.One (http://www.gov.hk/tc/theme/psi/datadownload/traffic.htm), process by waterlou (https://github.com/waterlou).

