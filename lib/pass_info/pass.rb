class PassInfo::Pass

    attr_accessor :name, :url, :temperature, :elevation, :restrictions_one, :restrictions_two, :conditions, :weather

    @@all = []

    @@urls = []

    def initialize(name,url)
        @name = name
        @url = url
        save
    end

    def self.all
        PassInfo::Scraper.scrape_passes if @@all.empty?
        @@all
    end

    def self.urls
        self.all.each do |link|
            @@urls << link.url
        end
    end

    def report
        PassInfo::Scraper.scrape_passes if @report.empty?
        @report
    end

    def save
        @@all << self
    end

    def clear_all
        @@all.clear
    end
end