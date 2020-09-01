require 'Nokogiri'
require 'open-uri'
require 'pry'

require '/Users/work/Documents/Flatiron/code/cli_project/goodreads_cli_scraper/lib/goodreads_cli_scraper.rb'
require "/Users/work/Documents/Flatiron/code/cli_project/goodreads_cli_scraper/lib/goodreads_cli_scraper/genre.rb"

class GoodreadsCliScraper::Scraper 
    # attr_accessor :genre 

    def get_page
        Nokogiri::HTML(open("https://www.goodreads.com/genres"))
    end

    def get_genres
        get_page.css("div.bigBoxContent.containerWithHeaderContent").css("div.left").css("a.gr-hyperlink")
        # returns an array of genres with an href attribute and text 
    end

    def make_genres
        get_genres.each.with_index do |a, i|
            genre = GoodreadsCliScraper::Genre.new 
            genre.name = a.text 
            genre.href = a['href']
            genre.save
        end
    end

    # def get_books 
    # end
end