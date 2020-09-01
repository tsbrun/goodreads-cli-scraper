class GoodreadsCliScraper::Book
    attr_accessor :title, :genre, :author, :summary, :url

    @@all = []

    def save 
        @@all << self
    end

    def self.all
        @@all 
    end
end