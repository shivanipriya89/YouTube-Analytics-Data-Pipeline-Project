# You-Tube Analytics Data Pipeline 
#4
create database dbyoutubes;
use dbyoutubes;
create table stg_myvideos(video_id bigint,channel_id bigint,video_title varchar(250),
category varchar(100),publish_date date);
create table stg_channels(channel_id bigint,channel_name varchar(100),channel_category varchar(130),
country varchar(100));
create table mytraffics(video_id bigint,traffic_date date,traffic_source varchar(130),
traffic_pct decimal(10,3),views_from_source bigint);
create table myvideometrics(video_id bigint,channel_id int,metric_date date,
views bigint,likes bigint,comments int,shares int,watch_time_minutes bigint,subscribers_gained 
int);
# Displaying the Records from Staging Tables 
select * from stg_myvideos;
select * from stg_channels;
select * from mytraffics;
select * from myvideometrics;
# Section B- SQL Analytics
#5
use dbyoutubes;
select v1.video_title,v1.category,sum(v2.views)as Total_Views,
sum(v2.likes)as Total_Likes,sum(v2.comments)as Total_Comments 
from videos v1 left join video_metrics v2 
on v1.video_id=v2.video_id 
group by v1.video_title,v1.category;

#6
use dbyoutubes;
select v1.video_id,v1.video_title,sum(v2.views)as Total_Views 
from videos v1 left join video_metrics v2 
on v1.video_id=v2.video_id 
group by v1.video_id,v1.video_title 
order by sum(v2.views)desc limit 5;

#7
use dbyoutubes;
select v1.video_id,v1.video_title,(v2.likes+v2.comments+v2.shares)/v2.views *100 
as engagement_rate from videos v1 left join video_metrics v2 
on v1.video_id=v2.video_id; 

#8
use dbyoutubes;
select c.channel_name,sum(c1.views)as Total_Views 
from channels c left join myvideometrics c1 
on c.channel_id=c1.channel_id 
group by c.channel_name;

#9
use dbyoutubes;
select v1.category,sum(v2.views)as Total_Views,
sum(v2.likes)as Total_Likes,sum(v2.comments)as Total_Comments 
from videos v1 left join video_metrics v2 
on v1.video_id=v2.video_id 
group by v1.category;

#10
use dbyoutubes;
select v1.video_id,v1.video_title,v1.category,sum(v2.views)as 
Total_Views,dense_rank()over(partition by v1.category order by sum(v2.views) desc)as 
VideoRankings 
from videos v1 left join video_metrics v2 
on v1.video_id=v2.video_id 
group by v1.video_id,v1.video_title,v1.category;

















