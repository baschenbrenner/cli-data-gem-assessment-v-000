class NFL::Scraper



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

    def self.scrape_offensive_leaders
      raw=Nokogiri::HTML(open("https://www.pro-football-reference.com/boxscores"))
      binding.pry
    end

    def self.scrape_all_games_for_week
      raw=Nokogiri::HTML(open("https://www.pro-football-reference.com/boxscores"))
      year_and_nfl_week = raw.css('h2').first.children.text
      unfiltered_array_of_games=raw.css('div.game_summary')
      game_dates_or_days = unfiltered_array_of_games.collect {|x| x.css('tr.date').first.children.text}
      visiting_teams_names = unfiltered_array_of_games.collect {|x| x.css('a').first.children.text}
      home_teams_names = unfiltered_array_of_games.collect{|x| x.css('a')[2].children.text}
      array_of_games = []
      i=0
      while i<game_dates_or_days.length
      new_game= NFL::Game.new(visiting_teams_names[i],home_teams_names[i],game_dates_or_days[i])
      array_of_games << new_game
      i +=1
      end
      return array_of_games

    end

    def self.update_game_scores
      raw=Nokogiri::HTML(open("https://www.pro-football-reference.com/boxscores"))
      year_and_nfl_week = raw.css('h2').first.children.text
      unfiltered_array_of_games=raw.css('div.game_summary')
end
