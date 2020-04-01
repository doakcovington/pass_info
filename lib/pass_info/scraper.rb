class PassInfo::Scraper

    def self.scrape_passes
        doc = Nokogiri::HTML(open("https://www.wsdot.com/traffic/passes/"))
        passes = doc.css("div.trafficCol div.content ul li")
        count = 0
        passes.each do |pass|
            if count <= 14
                name = pass.text
                ref = pass.css('a').attribute('href').value
                PassInfo::Pass.new(name,ref)
                count += 1
            end
            #binding.pry
        end
        count
        #binding.pry
    end

    #try using .send to send the info from the hash to the report

    def self.scrape_report(get_user_pass_url)#"https://www.wsdot.com/traffic/passes/blewett/default.aspx"
        a = get_user_pass_url
        a.insert(0,"https:")
        doc = Nokogiri::HTML(open(a))
        report = doc.css("div#PassPageBoxPanel.content")
        #binding.pry
        pass_report = {}
        report.each do |info|
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

    def self.scrape_text
        doc = Nokogiri::HTML(open("https://www.wsdot.com/traffic/passes/PassInformation.aspx"))
        report = doc.css("div.pass")
        passes = []
        text = []
        pass_report = {}
        report.each do |pass|
            passes << pass.text
            # info = pass.css("div.descripRed")
            # info.each do |text|
            #     passes << text.text
            #     #binding.pry
            # end

            # red = pass.css("div.descripRed")
            # red.each do |info|
            #     text << info.text.strip
            # end
        end
        passes.each do |element|
            text << element.split("\r")
        end
        c = [] #array containing the individual info elements from text only wsdot
        text.each do |a|
            a.each do |b|
                if b.length > 12
                    c << b
                end
            end
        end
        binding.pry
        passes
        text
        pass_report[:Elevation] = passes[0]
        pass_report[:Temperature] = passes[1]
        pass_report[:Conditions] = text[0]
        pass_report[:Weather] = text[1]
        pass_report[:Restrictions_North_or_West] = text[2]
        pass_report[:Restrictions_South_or_East] = text[3]
        pass_report
        binding.pry
    end


end