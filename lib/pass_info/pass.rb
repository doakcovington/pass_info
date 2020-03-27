class PassInfo::Pass

    attr_accessor :name
    attr_writer :report

    def initialize(name)
        @name = name
        @report = []
        save
    end

    @@all = []

    def self.all
        PassInfo::Scraper.scrape_passes if @@all.empty?
        @@all
    end

    def report
        PassInfo::Scraper.scrape_report(self) if @report.empty?
        @report
    end

    def save
        @@all << self
    end

    def clear_all
        @@all.clear
    end
end