USE `Proj_3`;

SET GLOBAL local_infile = 'ON';  
-- Loading user data
LOAD DATA LOCAL INFILE 'Users/rambekar/Downloads/project3_2/dataCSV/user.csv'
INTO TABLE TwitterUser
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(screen_name,usr_name,sub_category,category,state,followers,following);

-- loading tweets data
LOAD DATA LOCAL INFILE 'Users/rambekar/Downloads/project3_2/dataCSV/tweets.csv'
INTO TABLE tweets
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(tweet_id,text_body,retweet_count,@col4,@col5,posting_user)
set day_posted= day(str_to_date(@col5, '%Y-%m-%d %H:%i:%s')),
month_posted= month(str_to_date(@col5, '%Y-%m-%d %H:%i:%s')),
year_posted= year(str_to_date(@col5, '%Y-%m-%d %H:%i:%s'));

-- loading hashtag data
LOAD DATA LOCAL INFILE 'Users/rambekar/Downloads/project3_2/dataCSV/tagged.csv'
INTO TABLE hashtags
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@col1,tag_name);

LOAD DATA LOCAL INFILE 'Users/rambekar/Downloads/project3_2/dataCSV/tagged.csv'
INTO TABLE hashtag_used
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(tweet_id,tag_name);

-- loading url data
LOAD DATA LOCAL INFILE 'Users/rambekar/Downloads/project3_2/dataCSV/urlused.csv'
INTO TABLE urls
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@col1, url);

LOAD DATA LOCAL INFILE 'Users/rambekar/Downloads/project3_2/dataCSV/urlused.csv'
INTO TABLE url_used
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(tweet_id,url);

-- loading mentioned data
LOAD DATA LOCAL INFILE 'Users/rambekar/Downloads/project3_2/dataCSV/mentioned.csv'
INTO TABLE tweet_mentions
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(tweet_id,screen_name);

set sql_safe_updates = 0;
update TwitterUser set state = 'Florida' where state = 'FL';
update TwitterUser set state = 'Alabama' where state = 'AL';
update TwitterUser set state = 'Alaska' where state = 'AK';
update TwitterUser set state = 'Arizona' where state = 'AZ';
update TwitterUser set state = 'Arkansas' where state = 'AR';
update TwitterUser set state = 'California' where state = 'CA';
update TwitterUser set state = 'Connecticut' where state = 'CT';
update TwitterUser set state = 'Delaware' where state = 'DE';
update TwitterUser set state = 'District of Columbia' where state = 'DC';
update TwitterUser set state = 'Florida' where state = 'FL';
update TwitterUser set state = 'Georgia' where state = 'GA';
update TwitterUser set state = 'Hawaii' where state = 'HI';
update TwitterUser set state = 'Idaho' where state = 'ID';
update TwitterUser set state = 'Illinois' where state = 'IL';
update TwitterUser set state = 'Indiana' where state = 'IN';
update TwitterUser set state = 'Iowa' where state = 'IA';
update TwitterUser set state = 'Kansas' where state = 'KS';
update TwitterUser set state = 'Kentucky' where state = 'KY';
update TwitterUser set state = 'Louisiana' where state = 'LA';
update TwitterUser set state = 'Maine' where state = 'ME';
update TwitterUser set state = 'Maryland' where state = 'MD';
update TwitterUser set state = 'Massachusetts' where state = 'MA';
update TwitterUser set state = 'Michigan' where state = 'MI';
update TwitterUser set state = 'Minnesota' where state = 'MN';
update TwitterUser set state = 'Mississippi' where state = 'MS';
update TwitterUser set state = 'Missouri' where state = 'MO';
update TwitterUser set state = 'Montana' where state = 'MT';
update TwitterUser set state = 'Nebraska' where state = 'NE';
update TwitterUser set state = 'Nevada' where state = 'NV';
update TwitterUser set state = 'New Hampshire' where state = 'NH';
update TwitterUser set state = 'New Jersey' where state = 'NJ';
update TwitterUser set state = 'New Mexico' where state = 'NM';
update TwitterUser set state = 'New York' where state = 'NY';
update TwitterUser set state = 'North Carolina' where state = 'NC';
update TwitterUser set state = 'North Dakota' where state = 'ND';
update TwitterUser set state = 'Ohio' where state = 'OH';
update TwitterUser set state = 'Oklahoma' where state = 'OK';
update TwitterUser set state = 'Oregon' where state = 'OR';
update TwitterUser set state = 'Pennsylvania' where state = 'PA';
update TwitterUser set state = 'Rhode Island' where state = 'RI';
update TwitterUser set state = 'South Carolina' where state = 'SC';
update TwitterUser set state = 'South Dakota' where state = 'SD';
update TwitterUser set state = 'Tennessee' where state = 'TN';
update TwitterUser set state = 'Texas' where state = 'TX';
update TwitterUser set state = 'Utah' where state = 'UT';
update TwitterUser set state = 'Vermont' where state = 'VT';
update TwitterUser set state = 'Virginia' where state = 'VA';
update TwitterUser set state = 'Washington' where state = 'WA';
update TwitterUser set state = 'West Virginia' where state = 'WV';
update TwitterUser set state = 'Wisconsin' where state = 'WI';
update TwitterUser set state = 'Wyoming' where state = 'WY';
set sql_safe_updates = 1;