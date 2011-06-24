desc "find route"
task :route do
  # process each line of data.csv
  results = []
  csv = open("data/data.csv").read

  csv.each_line do |line|
    name, point1, coord1e, coord1n, point2, coord2e, coord2n, region, type = line.split(",")

    # convert HK80
    begin
      latlng1 = HkGeo::Converter.convert(coord1n, coord1e) rescue nil
      latlng2 = HkGeo::Converter.convert(coord2n, coord2e) rescue nil
      route = HkGeo::RouteFinder.route(latlng1.join(","), latlng2.join(",")) rescue nil
      if latlng1 && latlng2 && route
        results << {:name => name, :from => point1, :from_e => coord1e, :from_n => coord1n, :to => point2, :to_e => coord2e, :to_n => coord2n, :region => region, :type => type.strip, :route => route}
      end
      sleep 1
    rescue StandardError => e
      puts "error: #{e.inspect}"
      sleep 5
      retry
    end
  end

  File.open("output/route.json", 'w') {|f| f.write(results.to_json) }
end