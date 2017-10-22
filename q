
[1mFrom:[0m /home/baschenbrenner/cli-data-gem-assessment-v-000/nfl/lib/nfl/scraper.rb @ line 11 NFL::Scraper.scrape_scores_page_return_list_of_games_and_scores:

     [1;34m5[0m:   [32mdef[0m [1;36mself[0m.[1;34mscrape_scores_page_return_list_of_games_and_scores[0m(index_url)
     [1;34m6[0m: 
     [1;34m7[0m:      raw=[1;34;4mNokogiri[0m::HTML(open(index_url))
     [1;34m8[0m:      array_of_games=raw.css([31m[1;31m'[0m[31mdiv.new-score-box[1;31m'[0m[31m[0m)
     [1;34m9[0m:      list_of_games_w_home_team_first=[]
    [1;34m10[0m:      array_of_games.each {|games|
 => [1;34m11[0m: binding.pry
    [1;34m12[0m:        hometeam = games.css([31m[1;31m'[0m[31mdiv.home-team[1;31m'[0m[31m[0m).css([31m[1;31m'[0m[31ma[1;31m'[0m[31m[0m).first.attributes[[31m[1;31m"[0m[31mhref[1;31m"[0m[31m[0m].value.split([31m[1;31m"[0m[31m=[1;31m"[0m[31m[0m)[[1;34m1[0m]
    [1;34m13[0m:        awayteam = games.css([31m[1;31m'[0m[31mdiv.away-team[1;31m'[0m[31m[0m).css([31m[1;31m'[0m[31ma[1;31m'[0m[31m[0m).first.attributes[[31m[1;31m"[0m[31mhref[1;31m"[0m[31m[0m].value.split([31m[1;31m"[0m[31m=[1;31m"[0m[31m[0m)[[1;34m1[0m]
    [1;34m14[0m: 
    [1;34m15[0m: 
    [1;34m16[0m:        hometeamscore = games.css([31m[1;31m'[0m[31mdiv.home-team[1;31m'[0m[31m[0m).css([31m[1;31m'[0m[31mp.total-score[1;31m'[0m[31m[0m).text
    [1;34m17[0m:        awayteamscore = games.css([31m[1;31m'[0m[31mdiv.away-team[1;31m'[0m[31m[0m).css([31m[1;31m'[0m[31mp.total-score[1;31m'[0m[31m[0m).text
    [1;34m18[0m:        list_of_games_w_home_team_first << [31m[1;31m"[0m[31m#{hometeam}[0m[31m #{hometeamscore}[0m[31m vs. #{awayteam}[0m[31m #{awayteamscore}[0m[31m[1;31m"[0m[31m[0m
    [1;34m19[0m:        [1;34m#gamestatus[0m
    [1;34m20[0m:        [1;34m#possession[0m
    [1;34m21[0m:        [1;34m#last_play[0m
    [1;34m22[0m:      }
    [1;34m23[0m:      list_of_games_w_home_team_first
    [1;34m24[0m:   [32mend[0m

