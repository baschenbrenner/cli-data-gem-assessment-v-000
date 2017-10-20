class NFL::Game
attr_accessor :hometeam, :awayteam, :score_of_hometeam, :score_of_awayteam, :url, :game_played_on
  #this object is for games which exist between two teams - the teams are recorded as an array of 32 hashes

  @@games = []
    def initialize(name_of_team1,name_of_team2, game_date_or_day = "Sunday")
      @awayteam = name_of_team1
      @hometeam = name_of_team2
      @game_played_on = game_date_or_day

      @@games << self
    end

    def create_game(official_team_abbreviation) #creates a new instance of a game with one teams official abbreviation (e.g. NE or NYJ)

    end

    def find_official_abbreviation(input) #finds an official abbreviation from the input provided
      input=input.gsub("\n","")
      TEAMS_ARRAY.each do |team_hash|
        if team_hash.values[0][:array_of_searchable_terms_in_lowercase].include?(input.downcase)
          return team_hash.values[0][:team_abbreviation]
        end
      end

    end

    def single_game




      single_game=all_games.select{|game| game.include?(nfl_team_abbreviation)}
      puts "The current score is #{single_game[0]}"
      puts "Would you like to see the offensive game leaders? Enter 1 for yes and anything else to return to the main menu."
      response = gets
      if response.to_i ==1
        offensive_game_leaders(nfl_team_abbreviation)
      end
      #new_game.possession
      #new_game.last_play
    end

    def all_games
      all_games=Scraper.scrape_scores_page_return_list_of_games_and_scores("http://www.nfl.com/scores")
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
