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
       timeleft = games.css('span.time-left').text
       list_of_games_w_home_team_first << "#{hometeam} #{hometeamscore} vs. #{awayteam} #{awayteamscore} -- #{timeleft} "
       #gamestatus
       #possession
       #last_play
     }
     list_of_games_w_home_team_first
  end




    def self.scrape_offensive_leaders(game)
      raw=Nokogiri::HTML(open("https://www.pro-football-reference.com/boxscores"))
      unfiltered_array_of_games=raw.css('div.game_summary')

      i=0
      game_of_interest = nil
      while i<unfiltered_array_of_games.length
          if unfiltered_array_of_games[i].css('a').first.children.text.split(" ").last.downcase==game.awayteam.mascot.downcase
            game_of_interest = unfiltered_array_of_games[i]

          end
      i +=1
      end


      puts "Pass Leader is #{game_of_interest.css('table.stats')[0].css('a')[0].attributes["title"].value}: #{game_of_interest.css('table.stats')[0].css('td')[1].text} with #{game_of_interest.css('table.stats')[0].css('td.right')[0].text} yards"
      puts "Rush Leader is #{game_of_interest.css('table.stats')[0].css('a')[1].attributes["title"].value}: #{game_of_interest.css('table.stats')[0].css('td')[4].text} with #{game_of_interest.css('table.stats')[0].css('td.right')[1].text} yards"
      puts "Receiving Leader is #{game_of_interest.css('table.stats')[0].css('a')[2].attributes["title"].value}: #{game_of_interest.css('table.stats')[0].css('td')[4].text} with #{game_of_interest.css('table.stats')[0].css('td.right')[2].text} yards"

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
      unfiltered_array_of_games=raw.css('div.game_summary')
      unfiltered_array_of_games.each {|game| #extract home and away team scores and add them to the matching game from NFL::Game.review_games array
      }
      #need to create a loop - the scraper needs to get the score for games which have already been instantiated passing the information back into the game instance
    end

end
