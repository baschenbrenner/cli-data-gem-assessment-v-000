class Scraper



  def self.scrape_scores_page(index_url)

     raw=Nokogiri::HTML(open(index_url))
     array_of_games=raw.css('div.new-score-box')
     list_of_games_w_home_team_first=[]
     array_of_games.each {|games|

       hometeam = games.css('div.home-team').css('a').first.attributes["href"].value.split("=")[1]
       awayteam = games.css('div.away-team').css('a').first.attributes["href"].value.split("=")[1]


       hometeamscore = games.css('div.home-team').css('p.total-score').text
       awayteamscore = games.css('div.away-team').css('p.total-score').text
       list_of_games_w_home_team_first << "#{hometeam} #{hometeamscore} vs. #{awayteam} #{awayteamscore}"
       #gamestatus
       #possession
       #last_play
     }
     list_of_games_w_home_team_first






   end


end
