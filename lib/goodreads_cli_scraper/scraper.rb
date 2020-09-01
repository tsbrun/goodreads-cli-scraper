require 'Nokogiri'
require 'open-uri'
require 'pry'

require '/Users/work/Documents/Flatiron/code/cli_project/goodreads_cli_scraper/lib/goodreads_cli_scraper.rb'

class GoodreadsCliScraper::Scraper 
    # attr_accessor :genre 

    def self.get_page
        Nokogiri::HTML(open("https://www.goodreads.com/genres"))
    end
    binding.pry

    # def get_genres
    # end

    # def get_books 
    # end
end