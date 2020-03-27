class PassInfo::Report

    attr_accessor :name, :temperature, :elevation, :passRestrictionsOne, :passRestrictionsTwo, :conditions, :weather

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

end