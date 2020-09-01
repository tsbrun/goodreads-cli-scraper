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

    genre = GoodreadsCliScraper::Scraper.Genres.all.select {|genre| genre.name.downcase == input}

    if genre.books.empty?
        # scraper.genre.get_books
        # genre.print_books

        # open that genre's url
        scraper.get_books(genre.url)
        # scrape the url for books 
        # add those books to the specific genre 
        # print each book 
    else
        genre.print_books
    end
end

end