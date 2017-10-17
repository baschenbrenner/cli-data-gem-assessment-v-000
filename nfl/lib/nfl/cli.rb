#our CLI controller
class NFL::CLI

TEAMS_ARRAY = [
          {:ari=>
    {:team_abbreviation => "ARI",
       :full_name => "Arizona Cardinals",
       :array_of_searchable_terms_in_lowercase => ["ari","arizona","arizona cardinals","arizona cards","cards"]}},
          {:mia=>
    {:team_abbreviation => "MIA",
        :full_name => "Miami Dolphins",
        :array_of_searchable_terms_in_lowercase => ["mia","miami","miami dolphins","miami fins","fins","phins"]}}
      ]

      def find_official_abbreviation(input)
        TEAMS_ARRAY.each do |team_hash|
          if team_hash.values[0][:array_of_searchable_terms_in_lowercase].include?(input.downcase)
            return team_hash.values[0][:team_abbreviation]
          end
        end

      end

  def call
    welcome #basic welcome
    choose  #gives the structured menu with choices
    goodbye #goodbye method
  end

  def welcome
    puts "Welcome to NFL ScoreFinder. We can print scores of individual games or of all games."
    puts "Plus you will have an option to dive deeper into individual games to see passing, rushing and receiving leaders!"
  end

  def choose
    puts "Are you interested in a single game or seeing all scores?"
    puts "Enter 1 for single and 2 for all scores or enter 3 for exit"
    choice = gets
    while choice != 3
      if choice.to_i == 1
        puts "how to pick a name"

        single_game("NE")
      elsif choice.to_i == 2
        all_games
      elsif choice.to_i == 3
        return "Have a great day!"
      else
        puts "That is an invalid choice, choose again."
        choose
      end
    puts "Would you like to see more?"
    puts "Enter 1 for single and 2 for all scores or enter 3 for exit"
    choice = gets
    end

  end

  def deeper_dive
    passing_leader
    rushing_leader
    receiving_leader
    #option to repeat, see more
  end

  def single_game(name)
    nfl_team_abbreviation=find_official_abbreviation(name)
    array_of_opponent=find_game_based_on_one_team(name)
    new_game=NFL::Game.new(array_of_opponent[0],array_of_opponent[1])
    new_game.possession
    new_game.last_play
  end

  def all_games
    all_games=Scraper.scrape_scores_page("http://www.nfl.com/scores")
    i=0
    while i<all_games.length
      puts "#{all_games[i]}"
      i +=1
    end
  end

  def passing_leader
  end

  def rushing_leader
  end

  def receiving_leader
  end

  def goodbye
    puts "Sayonara!"
  end

  def find_game_based_on_one_team(abbreviated_name)
    opponent_array=["New England", "New York"]
  end


end
