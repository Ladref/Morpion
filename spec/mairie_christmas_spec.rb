require_relative "../lib/mairie_christmas"

  describe "the get_townhall_urls method" do
    it "should return the url of each city" do
      expect(get_townhall_urls("https://annuaire-des-mairies.com/val-d-oise.html")[0]).to eq("/95/ableiges.html")
      expect(get_townhall_urls("https://annuaire-des-mairies.com/val-d-oise.html")[5]).to eq("/95/argenteuil.html")
      expect(get_townhall_urls("https://annuaire-des-mairies.com/val-d-oise.html")[10]).to eq("/95/attainville.html")
    end
  end

  describe "the get_townhall_email_city_name method" do
    it "should return the mail and the name of each city" do
      expect(get_townhall_email_city_name(["/95/ableiges.html"])).to eq([{"ableiges"=>"mairie.ableiges95@wanadoo.fr"}])
      expect(get_townhall_email_city_name(["/95/aincourt.html"])).to eq([{"aincourt"=>"mairie.aincourt@wanadoo.fr"}])
      expect(get_townhall_email_city_name(["/95/ambleville.html"])).to eq({["ambleville"=>"mairie.ambleville@wanadoo.fr"}])
    end
  end
