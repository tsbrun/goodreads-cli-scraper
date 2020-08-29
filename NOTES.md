GoodreadsCliScraper::CLI 
=> prints welcome message 
=> creates scraper
=> scrapes genres and saves them 
=> displays genres 
=> prompts user to choose one 

if genre.books.empty?
    => scrapes data from Goodreads 
    => stores data in Book instances 
    => prints data based on info stored in Book.all (that matches genre)
else 
    => prints data based on info stored in genre.all (genre being the one they picked)

=> prompts user to pick another genre 

if y
    => restarts process of checking for books in that genre, et cetera...
if n
    => exits program

GoodreadsCliScraper::Genre
=> @name

Class Methods 
=> .all
Instance Methods 
=> #books 

=> one genre has-many books 

GoodreadsCliScraper::Book
=> @title, @genre, @author, @rating, @summary, @url

Class Methods 
=> .all
Instance Methods
=> 

=> a book belongs-to a genre 

GoodreadsCliScraper::Scraper 

goodreads genres 
=> 2 divs 
=> go into div 1 => grab each genre (text and url)
=> repeat for div 2
=> save into Genre.all 

To make Book instances from a genre 
=> go to chosen genre's url
=> open 

