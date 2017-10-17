NFL Score CLI

This ruby gem provides a CLI to get the current scores and game status for NFL games based on the NFL's site www.NFL.com

Installation

Usage

Development

Contributing

license


  Planning for the nfl project

  a command line interface for pulling up nfl scores from nfl.com

  a person would type in either a specific game or get all scores
  if they type in a specific game they get
  current score, plus status of game (final or game time) and possession of ball
  if they type in all they get all scores, including current score, status of game and possession of ball

  ? is there an extension that i will include? - right now planning on listing leader in different categories

  example:
  miami or mia
  gives me a return of the score for the miami game plus where we are in the game plus who has the ball
  and maybe last play

  or all
  gives me all scores of all games plus where each game is in the game

  so for single game i need:
  name of team1, score for team1
  name of team2, score for team2
  where we are in the game: could be "final" "haltime" or time + quarter (q1,q2,q3,q4 or ot)
  who has possession
  result of last play (as a string)

  for all games i need
  name of team1, score for team1
  name of team2, score for team2
  where we are in the game: could be "final" "haltime" or time + quarter (q1,q2,q3,q4 or ot)

  so since all games has code from single game i will work on that first
  in a method call game_score
  
