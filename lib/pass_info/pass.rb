class PassInfo::Pass

    attr_accessor :name, :url, :temperature, :elevation, :restrictions_one, :restrictions_two, :conditions, :weather

    @@all = []

    def initialize(pass_report)
        pass_report.each do |k,v|
            self.instance_variable_set("@#{k}", v)
         end
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