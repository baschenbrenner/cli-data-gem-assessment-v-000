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
        input=input.gsub("\n","")
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
        puts "OK! Which team are you interested in? You can enter:"
        puts "Full team name (e.g. Arizona cardinals)"
        puts "Abbreviation (e.g. pats)"
        puts "NFL Abbreviation (e.g. NYJ)"
        puts "City (e.g. Philadelphia)"
        puts "The input is not case sensitive"
        input = gets

        single_game(input)
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

    all_games=Scraper.scrape_scores_page_return_list_of_games_and_scores("http://www.nfl.com/scores")

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

  def offensive_game_leaders(abbreviation)
    find_game_page_based_on_one_team(abbreviation)
    Scraper.scrape_scores_page_return_list_of_game_url("http://www.nfl.com/scores")
    puts "#{abbreviation}"
  end

  def goodbye
    puts "Sayonara!"
  end

  def find_game_page_based_on_one_team(abbreviation)
    puts "#{abbreviated_name}"
  end


end
