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

    puts "#{i+1}. #{new_array[i].awayteam.city} vs. #{new_array[i].hometeam.city} played on #{new_array[i].game_played_on}"
    i+=1
    end
  end

  def choose
    puts "Are you interested in a single game or seeing all scores?"
    puts "Enter 1 for single and 2 for all scores or enter 3 for exit"
    choice = gets
    while choice != 3
      if choice.to_i == 1
        puts "OK! Which team are you interested in? Type in the team name (not case sensitive):"
        puts "For example for the Arizona cardinals type in 'cardinals' or 'Cardinals'"
        input = gets
        array_of_games=NFL::Game.review_games
        input = input.gsub("\n","").downcase
        matching_game=[]
        array_of_games.each {|game|
        if game.awayteam.mascot.downcase == input
          matching_game<<game
        end
        if game.hometeam.mascot.downcase == input
          matching_game<<game
        end
        }
        puts "You are interested in #{matching_game[0].awayteam.mascot} vs. #{matching_game[0].hometeam.mascot}!"
        puts "Here are the offensive leaders from that game:"
        NFL::Scraper.scrape_offensive_leaders
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
