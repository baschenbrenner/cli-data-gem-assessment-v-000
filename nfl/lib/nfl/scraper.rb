class Scraper


  def self.scrape_scores_page(index_url)
     html = File.read(index_url)
     raw=Nokogiri::HTML(html)


     #hometeam
     #awayteam
     #hometeamscore
     #awayteamscore
     #gamestatus
     #possession
     #last_play


    

   end


end
