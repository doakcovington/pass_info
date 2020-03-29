class PassInfo::Pass

    attr_accessor :name, :temperature, :elevation, :restrictions_one, :restrictions_two, :conditions, :weather

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def self.all
        PassInfo::Scraper.scrape_passes if @@all.empty?
        @@all
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