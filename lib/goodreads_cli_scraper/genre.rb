class GoodreadsCliScraper::Genre 
    attr_accessor :name, :url, :books

    @@all = []

    def save
        @@all << self
        @books = [] 
    end

    def self.all 
        @@all 
    end
end