class Scraper



  def self.scrape_scores_page_return_list_of_games_and_scores(index_url)

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


  def self.scrape_scores_page_return_list_of_game_url(index_url)
      raw=Nokogiri::HTML(open(index_url))
      array_of_games=raw.css('div.new-score-box')
      array_of_game_url=[]
      i=0
      while i<array_of_games.length
      array_of_game_url<<"http://www.nfl.com"+array_of_games[i].css('div.game-center-area').css('a')[0].attributes["href"].value
      i+=1
      end
      array_of_game_url
    end

    def self.scrape_offensive_leaders(game_center_url)
      raw=Nokogiri::HTML(open(index_url))
    end

end
