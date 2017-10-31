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

    new_array.each.with_index(1) do |game, i|
      puts "#{i}. #{game.awayteam.city} vs. #{game.hometeam.city} played on #{game.game_played_on}"
    end

    # i=0
    # while i<new_array.length
    #
    # puts "#{i+1}. #{new_array[i].awayteam.city} vs. #{new_array[i].hometeam.city} played on #{new_array[i].game_played_on}"
    # i+=1
    # end
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
        NFL::Scraper.scrape_offensive_leaders(matching_game[0])

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


  def goodbye
    puts "Thanks for dropping in: come back soon!"
  end




end
