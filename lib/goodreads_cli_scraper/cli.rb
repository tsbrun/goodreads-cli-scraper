class GoodreadsCliScraper::CLI 

def call
    puts "Welcome to the Goodreads CLI Scraper."

    scraper = GoodreadsCliScraper::Scraper.new
    scraper.make_genres 
    # initializes instances of Genre and stores them in class variable @@all 

    GoodreadsCliScraper::Genres.all.each { |genre| puts genre.name } 
    # prints Genre names 

    loop do 
        get_books_by_genre
        
        puts "Would you like to pick another genre? (y/n)"
        input = gets.strip.downcase 

        if input != 'y'
            break
        end
    end

end

def get_books_by_genre
    puts "Type the name of the genre you want:"
    input = gets.strip.downcase 

    genre = GoodreadsCliScraper::Genres.all.select {|genre| genre.name.downcase == input}

    if genre.books.empty?
        scraper.get_books(genre.url)
        genre.print_books
    else
        genre.print_books
    end
end

end