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

    def self.scrape_report#"https://www.wsdot.com/traffic/passes/blewett/default.aspx"
        doc = Nokogiri::HTML(open("https://www.wsdot.com/traffic/passes/blewett/default.aspx"))
        report = doc.css("div#PassPageBoxPanel.content")
        pass_report = {}
        report.each do |info|
            pass_report[:Name] = info.css("h2#ctl00_ctl00_PageHeader")
            pass_report[:Temperature] = info.css("span#PassInfoTemperature").text
            pass_report[:Elevation] = info.css("span#PassInfoElevationF").text
            pass_report[:Restrictions_One] = info.css("span#PassInfoRestrictionsOne").text
            pass_report[:Restrictions_Two] = info.css("span#PassInfoRestrictionsTwo").text
            pass_report[:Coditions] = info.css("span#PassInfoConditions").text
            pass_report[:Weather] = info.css("span#PassInfoWeather").text
            #report[:Restrictions] = 'none'
            #report[:conditions] = 'roadways are wet'
            #report[:weather] = 'partly cloudy'
        #doc.css("div#PassPageBoxPanel.content")
        #temp = doc.css("span#PassInfoTemperature")
        #elevation = doc.css("span#PassInfoElevationF")
        #restrictions one = doc.css("span#PassInfoRestrictionsOne")
        #restrictions two = doc.css("span#PassInfoRestrictionsTwo")
        #conditions = doc.css("span#PassInfoConditions")
        #weather = doc.css("span#PassInfoWeather")
        end
        pass_report
        #binding.pry
    end


end