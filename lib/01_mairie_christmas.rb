require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'pry'

#Create array of all town hall
def create_all_town_hall_array()
    page_all_town_hall_url = 'http://annuaire-des-mairies.com/val-d-oise.html'
    page_all_town_hall = Nokogiri::HTML(open(page_all_town_hall_url))
    all_town_hall_css = page_all_town_hall.css("a.lientxt")
    all_town_hall = []

    all_town_hall_css.each do |name|
        all_town_hall << name.text
    end
    return all_town_hall
end

#Modification of town hall : downcase and join with '-'
def modif_town_hall_name(all_town_hall)
    i = 0
    while i != all_town_hall.length
        all_town_hall[i] = all_town_hall[i].downcase!.split.join('-')
        i += 1
    end
    return all_town_hall
end

# Pick the email
def pick_email_from_town_hall(all_town_hall)
    arrays_town_and_email = []
    all_town_hall.each do |town_hall|
        page_town_hall_url = "http://annuaire-des-mairies.com/95/#{town_hall}.html"
        page_town_hall = Nokogiri::HTML(open(page_town_hall_url))
        town_hall_xpath = page_town_hall.xpath("//section[2]/div/table/tbody/tr[4]/td[2]")
        arrays_town_and_email << Hash[town_hall => town_hall_xpath.text]
    end
    return arrays_town_and_email
end

#Call the function
all_town_hall = create_all_town_hall_array()
all_town_hall = modif_town_hall_name(all_town_hall)
arrays_town_and_email = pick_email_from_town_hall(all_town_hall)

print arrays_town_and_email