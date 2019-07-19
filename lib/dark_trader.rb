require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pp'
PAGE_URL = "https://coinmarketcap.com/all/views/all/"

page = Nokogiri::HTML(open(PAGE_URL))
puts page.class

crypto_names = page.xpath('//a[@class="link-secondary"]')
crypto_price = page.xpath('//a[@class="price"]')

# Création d'un array pour récupérer les noms des cryptos
crypto_names_array = []
crypto_names.each do |crypto|
  crypto_names_array << crypto.text
end
#print crypto_names_array

# Création d'un array pour récupérer les prix des cryptos
crypto_price_array = []
crypto_price.each do |price|
  crypto_price_array << price.text
end
#print crypto_price_array

crypto_names_array.map! do |names|
  names = names.to_s
  #puts crypto.class
end
#puts crypto_names_array


crypto_price_array.map! do |crypto|
  crypto[0] = ""
  crypto = crypto.to_f
  #puts crypto.class
end
#print crypto_price_array



array = []
hash = Hash.new
crypto_names_array.zip(crypto_price_array).each do |names, price|
  hash = {names => price}
  puts "Mining crypto currencie #{hash} now..."
  array << hash
end

print array

# Alternative à ma
#for i in (0..crypto_names.length) do
#  crypto_couple_hash = {(crypto_names[i].to_s) => ((crypto_price[i].to_s)[1..-1].to_f)}
#  puts "Mining crypto currencie #{crypto_couple_hash} now..."
#  crypto_name_array << crypto_couple_hash
#end

puts "Array of #{crypto_names_array.length} cryptocurrencies done !!"
puts "Press enter to display it"
gets
print array
