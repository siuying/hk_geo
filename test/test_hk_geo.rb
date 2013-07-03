require "rubygems"
require "minitest/autorun"

$LOAD_PATH << "./lib"
require "hk_geo"

class TestHkGeo < MiniTest::Unit::TestCase
  def test_fetch    
    result = HkGeo::Converter.convert("835352.749", "815640.774")
    assert_equal("22.457521619", result[0])
    assert_equal("113.976469702", result[1])
    
    result = HkGeo::Converter.convert("835352.749", "815640.774", HkGeo::SYSTEM_HK80, HkGeo::SYSTEM_ITRF96, HkGeo::UNIT_DM)
    assert_equal("22.27 451297", result[0])
    assert_equal("113.58 588182", result[1])
  end
end