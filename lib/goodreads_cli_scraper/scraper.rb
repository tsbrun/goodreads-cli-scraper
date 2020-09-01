require 'Nokogiri'
require 'open-uri'
require 'pry'

require '/Users/work/Documents/Flatiron/code/cli_project/goodreads_cli_scraper/lib/goodreads_cli_scraper.rb'
require "/Users/work/Documents/Flatiron/code/cli_project/goodreads_cli_scraper/lib/goodreads_cli_scraper/genre.rb"
require '/Users/work/Documents/Flatiron/code/cli_project/goodreads_cli_scraper/lib/goodreads_cli_scraper/book.rb'

class GoodreadsCliScraper::Scraper 

    def get_page
        Nokogiri::HTML(open("https://www.goodreads.com/genres"))
    end

    def get_genres
        get_page.css("div.bigBoxContent.containerWithHeaderContent").css("div.left").css("a.gr-hyperlink")
        # returns an array of genres with an href attribute and text 
    end

    def make_genres
        get_genres.each do |a|
            genre = GoodreadsCliScraper::Genre.new 
            genre.name = a.text 
            genre.url = a['href']
            genre.save
        end
    end

    def get_books(url)
        Nokogiri::HTML(open("https://www.goodreads.com" + url)).css("div.coverRow").css("div.leftAlignedImage.bookBox").css("div.coverWrapper").each do |a| 
            book = GoodreadsCliScraper::Book.new 
            book.url = a.css("a").first['href']
            book.genre = GoodreadsCliScraper::Genre.all.find { |genre| genre.url == url }
            book.genre.books << book
            book.save
        end

        make_books
    end

    def make_books
        GoodreadsCliScraper::Book.all.each do |book|
            Nokogiri::HTML(open("https://www.goodreads.com/" + book.url))
            book.title = Nokogiri::HTML(open("https://www.goodreads.com/" + book.url)).css("h1#bookTitle").text.strip
            book.author = Nokogiri::HTML(open("https://www.goodreads.com/" + book.url)).css("a.authorName").css("span").text.strip
            book.summary = Nokogiri::HTML(open("https://www.goodreads.com/" + book.url)).css("div#description.readable.stacked").text.strip    
        end
    end
end