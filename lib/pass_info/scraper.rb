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

end