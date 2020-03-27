class PassInfo::Scraper

    def scrape_passes
        doc = Nokogiri::HTML(open("https://www.wsdot.com/traffic/passes/"))
        binding.pry
    end

end