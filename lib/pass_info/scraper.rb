class PassInfo::Scraper

    def self.scrape_passes
        doc = Nokogiri::HTML(open("https://www.wsdot.com/traffic/passes/"))
        passes = doc.css("div.trafficCol div.content ul li")
        count = 0
        passes.each do |pass|
            if count <= 14
                ref = pass.css('a').attribute('href').value
                count += 1
            end
        end
        count
    end

    # def self.scrape_report(get_user_pass_url)#"https://www.wsdot.com/traffic/passes/blewett/default.aspx"
    #     a = get_user_pass_url
    #     a.insert(0,"https:")
    #     doc = Nokogiri::HTML(open(a))
    #     report = doc.css("div#PassPageBoxPanel.content")
    #     #binding.pry
    #     @pass_report = {}
    #     report.each do |info|
    #         @pass_report[:Temperature] = info.css("span#PassInfoTemperature").text
    #         @pass_report[:Elevation] = info.css("span#PassInfoElevationF").text
    #         @pass_report[:Restrictions_One] = info.css("span#PassInfoRestrictionsOne").text
    #         @pass_report[:Restrictions_Two] = info.css("span#PassInfoRestrictionsTwo").text
    #         @pass_report[:Coditions] = info.css("span#PassInfoConditions").text
    #         @pass_report[:Weather] = info.css("span#PassInfoWeather").text
    #         #report[:Restrictions] = 'none'
    #         #report[:conditions] = 'roadways are wet'
    #         #report[:weather] = 'partly cloudy'
    #     #doc.css("div#PassPageBoxPanel.content")
    #     #temp = doc.css("span#PassInfoTemperature")
    #     #elevation = doc.css("span#PassInfoElevationF")
    #     #restrictions one = doc.css("span#PassInfoRestrictionsOne")
    #     #restrictions two = doc.css("span#PassInfoRestrictionsTwo")
    #     #conditions = doc.css("span#PassInfoConditions")
    #     #weather = doc.css("span#PassInfoWeather")
    #     end
    #     @@pass_report
    #     #binding.pry
    # end

    def self.scrape_text
        doc = Nokogiri::HTML(open("https://www.wsdot.com/traffic/passes/PassInformation.aspx"))
        report = doc.css("div.pass")
        passes = []
        text = []
        @pass_report = {}
        report.each do |pass|
            passes << pass.text.gsub("\n","").gsub("\t","")
        end
        passes.each do |element|
            text << element.split("\r")
        end
        pass_text = [] #array containing the individual info elements from text only wsdot
        text.each do |pass|
            pass_text << pass.reject{|element| element == "" || element == " "}#removes blank elements
        end
        passes
        text
        pass_text.each do |info|
            @pass_report[:name] = info[0]
            @pass_report[:elevation] = info[1]
            @pass_report[:temperature] = info[2]
            @pass_report[:conditions] = info[4]
            @pass_report[:weather] = info[6]
            #@pass_report[:restrictions_One] = info[5]
            #@pass_report[:restrictions_Two] = info[6]
            PassInfo::Pass.new(@pass_report)
        end
    end


end