require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'pry'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all"))   

    value_crypto = []
    symbol_crypto = []
    page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div').each do |tr|
    symbol_crypto << tr.text
end 
 
#binding.pry

page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]').each do |tr|
    value_crypto << tr.text
end

def dark_trader
  final_crypto = symbol_crypto.zip(value_crypto).map{|k, v| {"#{k}":v}}
end

print symbol_crypto.zip(value_crypto).map{|k, v| {"#{k}":v}} #pourquoi print final_crypto ne marche pas?