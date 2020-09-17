require 'pry'

def self.scrape_and_create_bootcamps
        url = "https://www.coursereport.com/best-coding-bootcamps" #webpage = open(url) #uses open-uri to open url + saves to file
        parsed_webpage = Nokogiri::HTML(open(url)) #parses info to become readable
        bootcamp_elements = parsed_webpage.css("div.info-container") #narrowed down elements with a specific div tagged that my class is housed in

        bootcamp_elements.map do |element| #iterates over each element to return new instances to class variable
        name_and_ranking = element.css("h3").children[0].text
        #binding.pry
        locations = element.css(".location").text #call each css selector and save to each variable
        overall_rating = element.css(".longform-rating-text").children[0].text
        link_to_info_section = "https://www.coursereport.com/schools/flatiron-school"
        Bootcamp.new(name_and_ranking,locations,overall_rating)
        #make a new instance out of bootcamp, which will go into @@all, [] and we will use that array later
        #binding.pry
    end
end

def self.scrape_info_bootcamps(url)
        url = "https://www.coursereport.com/best-coding-bootcamps"
        parsed_webpage = Nokogiri::HTML(open(url))
        info_section = parsed_webpage.css("div.about").css(".read-more").children[0].text
        binding.pry
  end
