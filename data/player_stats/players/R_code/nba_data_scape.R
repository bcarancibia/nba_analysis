
'nba/explorer/v3/data/per_game_stats_1951_2014.csv' %>>% read.csv %>>% tbl_df -> data
source('nba/explorer/v3/src/brefSeasonStatFunctions.R')


getBREFSeasonLeaders(year_end_season = 2015,'Per Game') -> pg
pg[2] %>>% data.frame() -> pg
pg$pos %>>% (colsplit(string = .,pattern = '\\-',names = c('pos_1','pos_2'))) %>>% 
  (.$pos_1 -> pg$pos)

data$pos %>>% (colsplit(string = .,pattern = '\\-',names = c('pos_1','pos_2'))) %>>% 
  (.$pos_1 -> data$pos)
names(pg) %>>% (gsub(1,'',.)) -> names(pg)
rbind(pg,data)
data %>>% str
pg %>>% str
pg$age %>>% as.numeric -> pg$age
names(data)[!names(data) %in% names(pg)]
data %>>% write.csv('nba_player_per_game_data_1951_2015')
NULL -> pg$scrape_time
data %>>%
  arrange(desc(season)) -> data

Sys.time() -> data$scrape_time
