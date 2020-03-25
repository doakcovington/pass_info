class PassInfo::Pass

    attr_accessor :name

    def initialize(name)
        @name = name
        save
    end

    @@all = []

    def self.all
        @@all
    end

    def save
        @@all << self
    end
end