class GoodreadsCliScraper::Genre 
    attr_accessor :name, :url, :books

    @@all = []

    def save
        @@all << self
        @books = [] 
    end

    def print_books
        self.books.each do |book|
            puts "\n"
            puts "Title: ".cyan + "#{book.title.light_cyan}"
            puts "Genre: ".cyan + "#{book.genre.name.light_cyan}"
            puts "Author: ".cyan + "#{book.author.light_cyan}"
            puts book.summary.black.on_white
            puts "https://www.goodreads.com/" + book.url
            puts "\n"
        end
    end

    def self.all 
        @@all 
    end
end