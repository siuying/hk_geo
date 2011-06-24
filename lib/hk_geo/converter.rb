require 'rubygems'
require 'mechanize'

module HkGeo
  SYSTEM_HK80 = "HK1980"
  SYSTEM_HKLATLONG = "HKLatLong"
  SYSTEM_ITRF96 = "ITRF96"
  SYSTEM_UTM84 = "UTM84"
  SYSTEM_UTMGR = "UTMGR"

  UNIT_DMS = "DMS"
  UNIT_DEC = "DecDegree"
  UNIT_DM = "DM"
  UNITS = [UNIT_DMS, UNIT_DEC, UNIT_DM]

  class Converter  
    SERVICE_URL = "http://www.geodetic.gov.hk/smo/tform/tra_tform.aspx"
  
    def self.convert(north, east, from_coord_system=SYSTEM_HK80, to_coord_system=SYSTEM_ITRF96, unit_type=UNIT_DEC)
      agent = Mechanize.new do |agent|
        agent.user_agent_alias = 'Mac Safari'
      end

      page = agent.get(SERVICE_URL) 
      form = page.form_with(:name => 'form1')
      form.DropDownList1 = "in#{from_coord_system}"
      form.DropDownList2 = "out#{to_coord_system}"
      form.TextBox12 = north.to_s
      form.TextBox13 = east.to_s
      form.radiobuttons_with(:name => 'RadioButtonList1')[UNITS.index(unit_type)].check
      result = form.submit(form.buttons.first)

      doc = Nokogiri::HTML(result.body)
      [doc.css("#Label16").text, doc.css("#Label17").text]
    end

    def self.systems
      [SYSTEM_HK80, SYSTEM_HKLATLONG, SYSTEM_ITRF96, SYSTEM_UTM84, SYSTEM_UTMGR]
    end
  end
end