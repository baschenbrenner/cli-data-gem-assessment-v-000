class NFL::Game
attr_accessor :team1, :team2, :score_of_team1, :score_of_team2

#not sure if i should change team1 to home team and team2 to away team, seems useful since otherwise you could have repeated instances
#of the same game with teams switched.
@@games = []
  def initialize(name_of_team1,name_of_team2)
    @team1 = name_of_team1
    @team2 = name_of_team2

    @@games << self
  end

  def game_update
    @score_of_team1 = find_score_of_home_team(self)
    @score_of_team2 = find_score_of_away_team(self)
  end

    
  def possession
    puts "#{self.team1} has possession of the ball"
  end

  def last_play
    puts "the last play was ..."
  end

end



new_game=NFL::Game.new(name)
new_game.possession
new_game.last_play
