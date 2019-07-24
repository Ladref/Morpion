class Scrapper

  def initialize
  end

  def get_townhall_urls(url)
    page = Nokogiri::HTML(open(url))
    cities_url = page.xpath('//a[@class="lientxt"]').to_a
    links = (cities_url.map {|url| url["href"][1..-1]}).to_a
    #puts links
    return links
  end

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

  def save_as_json(array)
    File.open("db/email.json","w") do |f|
      f.write(array.to_json)
    end
  end

  def save_as_csv(array)
    CSV.open("db/emails2.csv", "w") do |csv|
      array.each do |hash|
        csv << hash
      end
    end
  end

#  def getHash(name_array, mail_array)
#    array = []
#    hash = Hash.new
#    name_array.zip(mail_array).each do |names, mail|
#      hash = {names.downcase => mail}
#      array << hash
#    end
#    puts array
#    return array
#  end


  def perform
    urls = get_townhall_urls("https://annuaire-des-mairies.com/val-d-oise.html")
    array = get_townhall_email_city_name(urls)
    #emails_json = save_as_json(array)
    emails_csv = save_as_csv(array)
  end

end
