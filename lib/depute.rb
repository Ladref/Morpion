require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_deputes_urls(url)
  page = Nokogiri::HTML(open(url))
  cities_url = page.xpath('//a[@class="lientxt"]').to_a
  links = (cities_url.map {|url| url["href"][1..-1]}).to_a
  #puts links
  return links
end


page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036"))
depute_url = page.xpath('//dd[4]/ul/li[2]/a/text()')
depute_name = page.xpath('//*[@id="haut-contenu-page"]/article/div[1]/ol/li[5]/text()')
puts depute_url
puts depute_name
