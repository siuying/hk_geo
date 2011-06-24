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
  
  def test_route
    result1 = HkGeo::Converter.convert("834038.674", "816345.067")
    result2 = HkGeo::Converter.convert("833862.7", "816441.553")

    puts "#{result1.join(",")}, #{result2.join(",")}"
    data = HkGeo::RouteFinder.route(result1.join(","), result2.join(","))
    puts data.inspect
  end
end