class PassInfo::Pass

    attr_accessor :name, :temperature, :elevation, :conditions, :weather

    @@all = []

    def initialize(pass_report)
        pass_report.each {|k,v| self.send("#{k}=", v)}
        save
    end

    def self.all
        PassInfo::Scraper.scrape_passes if @@all.empty?
        @@all
    end

    def self.find_pass(user_pass)
        @@all.detect{|pass| pass.name == user_pass}
    end

    def save
        @@all << self
    end

    def clear_all
        @@all.clear
    end
end