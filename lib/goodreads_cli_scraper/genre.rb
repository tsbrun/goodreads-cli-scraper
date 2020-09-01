class GoodreadsCliScraper::Genre 
    attr_accessor :name, :href, :books

    @@all = []

    def save
        @@all << self
        @books = [] 
    end

    def print_books
    end

    def self.all 
        @@all 
    end
end