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

#Scraper method for pulling URL
def self.scrape_scores_page_return_list_of_game_url
  raw=Nokogiri::HTML(open("http://www.nfl.com/scores)"))
  array_of_games=raw.css('div.new-score-box')
  array_of_game_url=[]
  i=0
    while i<array_of_games.length
    array_of_game_url<<"http://www.nfl.com"+array_of_games[i].css('div.game-center-area').css('a')[0].attributes["href"].value
    i+=1
    end
  array_of_game_url
end
