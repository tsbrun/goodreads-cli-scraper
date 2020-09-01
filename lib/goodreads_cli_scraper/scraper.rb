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
    ## should take an argument of the genre's url  
    ## open url 
        Nokogiri::HTML(open("https://www.goodreads.com" + url)).css("div.coverRow").css("div.leftAlignedImage.bookBox").css("div.coverWrapper").each do |a| 
            book = GoodreadsCliScraper::Book.new 
            book.url = a.css("a").first['href']
            book.save
        end
    ## access each book's href attribute 
    ## open each href 
    ## gather data + instantiate books 

    ## iterate over "div.coverWrapper"
    end
    binding.pry
end