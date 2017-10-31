#our CLI controller
class NFL::CLI


  def call
    NFL::Scraper.scrape_all_games_for_week
    welcome #basic welcome
    choose  #gives the structured menu with choices
    goodbye #goodbye method
  end

  def welcome
    puts "Welcome to NFL ScoreFinder. Here are the games happening this week."

    NFL::Game.all.each.with_index(1) do |game, i|
      puts "#{i}. #{game.awayteam.city} vs. #{game.hometeam.city} played on #{game.game_played_on}"
    end

  end


  def choose
    puts "Are you interested in a single game or seeing all scores?"
    puts "Enter 1 for single and 2 for all scores or enter 3 for exit"
    choice = gets
    while choice != 3
      if choice.to_i == 1
        puts "OK! Which game are you interested in? Type in the number that corresponds to the game from the above list."
        input = gets

        game=NFL::Game.all[input.to_i-1]

        puts "You are interested in #{game.awayteam.mascot} vs. #{game.hometeam.mascot}!"
        puts "Here are the offensive leaders from that game:"
        NFL::Scraper.scrape_offensive_leaders(game)
        
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
