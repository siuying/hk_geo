require "rubygems"
require "test/unit"
require "hk_geo"

class TestHkGeo < Test::Unit::TestCase
  def test_fetch    
    result = HkGeo::Converter.convert("835352.749", "815640.774")
    assert_not_nil(result)
    assert_equal("22.457521648", result[0])
    assert_equal("113.976469709", result[1])
    
    result = HkGeo::Converter.convert("835352.749", "815640.774", HkGeo::SYSTEM_HK80, HkGeo::SYSTEM_ITRF96, HkGeo::UNIT_DM)
    assert_not_nil(result)
    assert_equal("22.2745130", result[0])
    assert_equal("113.5858818", result[1])
    
  end
end