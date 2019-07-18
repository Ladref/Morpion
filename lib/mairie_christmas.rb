require 'rubygems'
require 'nokogiri'
require 'open-uri'

#page = Nokogiri::HTML(open(PAGE_URL))
#puts page.class

def get_townhall_urls(url)
  page = Nokogiri::HTML(open(url))
  cities_url = page.xpath('//a[@class="lientxt"]').to_a
  links = (cities_url.map {|url| url["href"][1..-1]}).to_a
  #puts links
  return links
end


#get_townhall_urls("http://annuaire-des-mairies.com/val-d-oise.html")

def get_townhall_email_city_name(urls)
  mail_array = []
  name_array = []
  array = []
  hash = Hash.new
  urls.each do |url|
    page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com#{url}"))
    #puts page.class
    mail = page.xpath('//section[2]/div/table/tbody/tr[4]/td[2]').text
    name = page.xpath('//div/div/div/h1').text[0...-8]
    #puts mail.class
    #Sinon prendre tout le Xpath mais mettre /text() à la fin
    #/html/body/div[2]/main/section[2]/div/table/tbody/tr[4]/td[2]
    mail_array << mail.to_s
    name_array << name.to_s
    end
  #print name_array, mail_array
  array = []
  hash = Hash.new
  name_array.zip(mail_array).each do |names, mail|
    hash = {names.downcase => mail}
    array << hash
  end
  puts array
  return array
end


def getHash(name_array, mail_array)
  array = []
  hash = Hash.new
  name_array.zip(mail_array).each do |names, mail|
    hash = {names.downcase => mail}
    array << hash
  end
  puts array
  return array
end


# //main/section[1]/div/div/div/h1

# get_townhall_email_city_name(["/95/villaines-sous-bois.html", "/95/vallangoujard.html", "/95/themericourt.html"])

def perform
  urls = get_townhall_urls("https://annuaire-des-mairies.com/val-d-oise.html")
  puts array = get_townhall_email_city_name(urls)
  #puts getHash(name_array, mail_array)
 end

perform
