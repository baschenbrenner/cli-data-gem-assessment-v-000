#our CLI controller
class NFL::CLI


  def call
    welcome
    choose
    goodbye
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
      single_game
      elsif choice.to_i == 2
        all_games
      elsif choice.to_i == 3
        return "Have a great day!"
      else
        puts "That is an invalid choice, choose again."
        choose
      end
    puts "Would you like to see more?"
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
    array_of_opponent=find_game_based_on_one_team(name)
    new_game=NFL::Game.new(array_of_opponent[0],array_of_opponent[1])
    new_game.possession
    new_game.last_play
  end

  def all_games
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

end
