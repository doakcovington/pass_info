class PassInfo::Pass

    attr_accessor :name

    def initialize(name)
        @name = name
        save
    end

    @@all = []

    def self.all
        PassInfo::Scraper.scrape_passes if @@all.empty?
        @@all
    end

    def save
        @@all << self
    end

    def clear_all
        @@all.clear
    end
end