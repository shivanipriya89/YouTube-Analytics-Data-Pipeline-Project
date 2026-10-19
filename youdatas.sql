# Section C - Data Warehouse
#12
create database dbwarehouse;
use dbwarehouse;
create table dim_video(video_id bigint primary key,channel_id int,video_title varchar(100),
category varchar(70),publish_date date);
create table dim_channels(channel_id int primary key,channel_name varchar(100),channel_category 
varchar(60),country varchar(100));
create table dim_date(date_key bigint primary key,full_date date,dyear year,dmonth int,
dimday int,day_name varchar(100));
create table dim_traffic_sources(video_id int,traffic_date date,traffic_source varchar(100),
traffic_pct decimal(7,3),views_from_source bigint);
create table fact_video_metrics(video_id int,channel_id int,metric_date date,views bigint,
likes int,comments int,shares int,watch_time bigint,subscribers_gained int);
create table fact_video_events(event_id varchar(100) primary key,video_id int,channel_id int,
event_type varchar(60),user_country varchar(90),event_timestamp timestamp);

#13
use dbwarehouse;
select * from dim_video;
select * from dim_channels;
select * from dim_date;
select * from dim_traffic_sources;

#14
use dbwarehouse;
select * from fact_video_metrics;

#15
use dbwarehouse;
select sum(views)as Total_Views,sum(likes)as Total_Likes,
sum(comments)as Total_Comments,sum(watch_time)as Total_Watch_Time,
sum(subscribers_gained)as Total_Subscribers_gained from fact_video_metrics;




















