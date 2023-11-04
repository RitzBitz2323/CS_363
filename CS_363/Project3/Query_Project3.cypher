//Q1

MATCH (u:User)-[p:POSTED]->(tw:Tweet) where tw.month="1" and tw.year="2016"
RETURN tw.retweet_count as trc, tw.text, u.screen_name, u.category, u.sub_category
ORDER BY toInteger(trc) DESC
LIMIT 5;

//Q2

MATCH (s:State)-[f:FROM]-(u:User)-[p:POSTED]->(t:Tweet)<-[ta:TAGGED]-(h:Hashtag)
WHERE t.year = "2016"
AND h.name <> ""
AND s.name <>"na"
with toLower(h.name) as hashtag_text, count(DISTINCT s) as statenum, collect( DISTINCT s) as states
return statenum,states,hashtag_text
order by statenum  desc limit 5;


//Q3

MATCH (u:User)-[p:POSTED]->(t:Tweet)<-[ta:TAGGED]-(h:Hashtag)
WHERE h.name = "HappyNewYear"
OR h.name = "NewYear"
OR h.name ="NewYears"
OR h.name ="NewYearsDay"
with DISTINCT u.screen_name as name, u.location as location, toInteger(u.followers) as fol
return name, location
order by fol desc limit 12;

//Q4

MATCH(u:User) where u.sub_category = "GOP"
RETURN u.screen_name, u.sub_category, u.followers as fol
ORDER BY toInteger(fol) DESC
LIMIT 5;

MATCH(u:User) where u.sub_category = "democrat"
RETURN u.screen_name, u.sub_category, u.followers as fol
ORDER BY toInteger(fol) DESC
LIMIT 5;

//Q5

MATCH (s:State)-[f:FROM]-(u:User)-[p:POSTED]->(t:Tweet)<-[ta:TAGGED]-(h:Hashtag)
WHERE (s.name = "Ohio"
OR s.name = "Alaska"
OR s.name  = "Alabama")
AND t.year = "2016"
AND t.month = "1"
AND h.name <> ""
RETURN DISTINCT h.name,s.name
ORDER BY toLower(h.name);

//Q6

MATCH (u:User)-[p:POSTED]->(tw:Tweet)<-[ta:TAGGED]-(h:Hashtag) where u.location = "Ohio"
AND (u.sub_category = "GOP" or u.sub_category = "democrat")
AND h.name ="Ohio"
AND tw.month="1"
AND tw.year="2016"
RETURN DISTINCT tw.text,h.name,u.screen_name,u.sub_category
ORDER BY tw.text LIMIT 5;

//Q7

MATCH (s:State)-[f:FROM]-(u:User)-[p:POSTED]->(t:Tweet)-[us:URL_USED]->(ur:Url)
WHERE u.sub_category = "GOP"
AND t.month = "1"
AND t.year = "2016"
AND ur.url <> ""
RETURN  u.screen_name, s.name, COLLECT(ur.url) as all_url
ORDER BY u.screen_name;

//Q8

MATCH (s:State)-[f:FROM]-(u:User)-[p:POSTED]->(tw:Tweet)-[m:MENTIONED]->(ur:User)
WHERE u.sub_category = "GOP"
AND tw.month = "1"
AND tw.year = "2016"
AND ur.screen_name <> ""
WITH ur.screen_name as mentionedUser, s.state as ustate, collect(distinct u.screen_name) as listMentioningUsers, count(ur.screen_name) as numTweets
RETURN mentionedUser, ustate, listMentioningUsers
ORDER BY numTweets desc limit 5;

//Q9

MATCH (u:User)-[p:POSTED]->(tw:Tweet)<-[ta:TAGGED]-(h:Hashtag)
WHERE (u.sub_category = "GOP") AND (tw.month="1" OR tw.month="2" OR tw.month="3") AND tw.year = "2016" AND h.name <> "" with toLower(h.name) as hashtagName
RETURN hashtagName, count(toLower(hashtagName)) as tweetcount
ORDER BY tweetcount desc limit 5;
