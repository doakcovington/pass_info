class PassInfo::Scraper

    def self.scrape_passes
        doc = Nokogiri::HTML(open("https://www.wsdot.com/traffic/passes/"))
        passes = doc.css("div.trafficCol div.content ul li")
        passes.each do |pass|
            name = pass.text
            PassInfo::Pass.new(name)
            ref = pass.attr("value")
        end
    end

    def self.scrape_report
        report = {}
        report[:temp] = 50
        #doc.css("div#PassPageBoxPanel.content")
        #temp = doc.css("span#PassInfoTemperature")
        #elevation = doc.css("span#PassInfoElevationF")
        #restrictions one = doc.css("span#PassInfoRestrictionsOne")
        #restrictions two = doc.css("span#PassInfoRestrictionsTwo")
        #conditions = doc.css("span#PassInfoConditions")
        #weather = doc.css("span#PassInfoWeather")
        report
        #binding.pry
    end


end