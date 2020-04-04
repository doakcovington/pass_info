class PassInfo::Scraper

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
            text << element.split("\r") #push the pass text into a subarray
        end
        pass_text = [] #array containing the individual info elements from text only wsdot
        text.each do |pass|
            pass_text << pass.reject{|element| element == "" || element == " "}#removes blank elements
        end

        pass_text.each do |info|
            @pass_report[:name] = info[0]
            @pass_report[:elevation] = info[1]
            @pass_report[:temperature] = info[2]
            @pass_report[:conditions] = info[4]
            @pass_report[:weather] = info[6]
            if info[7].include?("Restrictions") #Some passes don't have restrictions on the WSDOT website
                @pass_report[:restrictions_One] = info[7]
                @pass_report[:restrictions_Two] = info[8]
            else
                @pass_report[:restrictions_One] = nil
                @pass_report[:restrictions_Two] = nil 
            end
            PassInfo::Pass.new(@pass_report)
        end
    end


end