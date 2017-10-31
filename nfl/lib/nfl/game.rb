class NFL::Game
attr_accessor :hometeam, :awayteam, :score_of_hometeam, :score_of_awayteam, :url, :game_played_on
  #this object is for games which exist between two teams - the teams are recorded as an array of 32 hashes

  @@games = []
    def initialize(name_of_team1,name_of_team2, game_date_or_day = "Sunday")
      @awayteam = NFL::Team.new(name_of_team1)
      @hometeam = NFL::Team.new(name_of_team2)
      @game_played_on = game_date_or_day

      @@games << self
    end

    def self.all
      @@games
    end

    def self.all_games
      all_games=NFL::Scraper.scrape_scores_page_return_list_of_games_and_scores("http://www.nfl.com/scores")
      i=0
      while i<all_games.length
        puts "#{all_games[i]}"
        i +=1
      end
    end

    def update_current_game(game)
      NFL::Scraper.udpate_game_scores
    end

    

end
