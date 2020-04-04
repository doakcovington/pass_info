class PassInfo::Pass

    attr_accessor :name, :temperature, :elevation, :conditions, :weather, :restrictions_One, :restrictions_Two

    @@all = []

    def initialize(pass_report)
        pass_report.each {|k,v| self.send("#{k}=", v)}
        save
    end

    def self.all
        PassInfo::Scraper.scrape_text if @@all.empty?
        @@all
    end

    def self.pass_names
        PassInfo::Pass.all.collect{|pass| pass.name}
    end

    def pass_text
        @text = PassInfo::Scraper.scrape_text
    end
    
    def save
        @@all << self
    end

    def clear_all
        @@all.clear
    end
end