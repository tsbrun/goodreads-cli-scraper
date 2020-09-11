require 'colorize'

class GoodreadsCliScraper::CLI 

def call
    puts "Welcome to the Goodreads CLI Scraper."
    puts "\n"

    @scraper = GoodreadsCliScraper::Scraper.new
    @scraper.make_genres 
    # initializes instances of Genre and stores them in class variable @@all 

    loop do 
        GoodreadsCliScraper::Genre.all.each { |genre| puts genre.name }
        puts "\n"

        get_books_by_genre
        
        puts "Would you like to pick another genre? (y/n)"
        input = gets.strip.downcase 

        if input != 'y'
            puts "Thank you for using the Goodreads CLI Scraper."
            break
        end
    end

end

def get_books_by_genre
    puts "Type the name of the genre you want:"
    input = gets.strip.downcase 

    genre = GoodreadsCliScraper::Genre.all.find {|genre| genre.name.downcase == input}

    
    @scraper.get_books(genre.url) if genre.books.empty?
    print_books(genre)
end

def print_books(genre)
    genre.books.each do |book|
        puts "\n"
        puts "Title: ".cyan + "#{book.title.light_cyan}"
        puts "Genre: ".cyan + "#{book.genre.name.light_cyan}"
        puts "Author: ".cyan + "#{book.author.light_cyan}"
        puts "\n"
        puts book.summary.white
        puts "\n"
        puts ("https://www.goodreads.com/" + book.url).light_cyan
        puts "\n"
    end
end

end



