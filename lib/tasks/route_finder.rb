desc "find route"
task :route do
  # process each line of data.csv
  results = JSON(open("output/route.json").read) rescue {}
  csv = open("data/data.csv").read

  csv.each_line do |line|
    name, point1, coord1e, coord1n, point2, coord2e, coord2n, region, type = line.split(",")

    begin
      unless results[name]
        puts "find path: #{name}"
        
        # convert HK80
        latlng1 = HkGeo::Converter.convert(coord1n, coord1e) rescue nil
        latlng2 = HkGeo::Converter.convert(coord2n, coord2e) rescue nil

        # find route
        route = HkGeo::RouteFinder.route(latlng1.join(","), latlng2.join(",")) rescue nil
      
        # if everyting is OK, write
        if latlng1 && latlng2 && route
          results[name] = {:name => name, 
              :from => point1, :from_e => coord1e, :from_n => coord1n, :from_converted => latlng1,
              :to => point2, :to_e => coord2e, :to_n => coord2n, :to_converted => latlng2,
              :region => region, :type => type.strip, :route => route,}
          File.open("output/route.json", 'w') {|f| f.write(results.to_json) }
        else
          puts "ERROR: failed finding route #{name}"
        end
        sleep 1
      end

    rescue StandardError => e
      puts "ERROR: error loading route #{name}, #{e.inspect}"
      sleep 5
      retry

    end
  end
end