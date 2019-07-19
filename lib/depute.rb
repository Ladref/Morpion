require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'


def get_deputes_urls(url)
  array = []
  page = Nokogiri::HTML(open(url))
  urls = page.xpath('//*[@id="deputes-list"]/div/ul/li/a/@href').to_a
  urls.each do |url|
    array << url.text
  end
  #print array
  return array
end

#get_deputes_urls("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")


def get_deputes_information(urls)
  depute_mail_array = []
  depute_name_array = []
  urls.each do |url|
    page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr#{url}"))
    depute_mail = page.xpath("//*[@class='deputes-liste-attributs']//dd//ul//li[2]//a").text
    depute_name = page.xpath('//*[@id="haut-contenu-page"]/article/div[1]/ol/li[5]/text()').text
    depute_mail_array << depute_mail.to_s
    depute_name_array << depute_name.to_s
  end
  complet = depute_name_array.zip(depute_mail_array)
  File.write("deputes.csv", complet.map(&:to_csv).join)
end
#http://www2.assemblee-nationale.fr#{url}
#get_deputes_information("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036")

#def perform
urls_deputes = get_deputes_urls("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")
get_deputes_information(urls_deputes)
#end
