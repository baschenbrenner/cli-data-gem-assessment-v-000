#our CLI controller
class NFL::CLI


  def call
    welcome #basic welcome
    choose  #gives the structured menu with choices
    goodbye #goodbye method
  end

  def welcome
    puts "Welcome to NFL ScoreFinder. Here are the games happening this week."
    new_array=NFL::Scraper.scrape_all_games_for_week
    
    i=0
    while i<new_array.length

    puts "#{i+1}. #{new_array[i].awayteam} vs. #{new_array[i].hometeam} played on #{new_array[i].game_played_on}"
    i+=1
    end
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

        new_game=NFL::Game.new(input)
        new_game.single_game
      elsif choice.to_i == 2
        NFL::Game.all_games
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





  def offensive_game_leaders(abbreviation)
    Scraper.scrape_offensive_leaders(find_game_page_based_on_one_team(abbreviation))



  end

  def goodbye
    puts "Sayonara!"
  end

  def find_game_page_based_on_one_team(abbreviation)
    array_of_game_url=Scraper.scrape_scores_page_return_list_of_game_url("http://www.nfl.com/scores")
    lowercase_search_name ="donkeys"
    TEAMS_ARRAY.each do |team|
        if team.values[0][:team_abbreviation] == abbreviation
            lowercase_search_name=team.values[0][:full_name].split.last.downcase
        end
      end
    array_of_game_url.select{|game_url| game_url.include?(lowercase_search_name)}.first
  end


end
