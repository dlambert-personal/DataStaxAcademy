// Exercise 2

// 3
CREATE KEYSPACE killrvideo
  WITH REPLICATION = { 
   'class' : 'SimpleStrategy', 
   'replication_factor' : 1 
  };
 
// 5
 CREATE TABLE videos (
   video_id timeuuid, 
   added_date timestamp, 
   Title text, 
   PRIMARY KEY (video_id));
   
// 6
 INSERT INTO videos (video_id, added_date, Title) VALUES 
  (1645ea59-14bd-11e5-a993-8138354b7e31, '2014-01-29', 'Cassandra History');
 
// 7 
 SELECT * FROM videos
 
// 8 
 INSERT INTO videos (video_id, added_date, Title) VALUES 
  (245e8024-14bd-11e5-9743-8238356b7e32, '2012-04-03', 'Cassandra & SSDs');

 SELECT * FROM videos
  
// 9
 TRUNCATE videos;
 
// 10 
 COPY videos(video_id, added_date, title)
 FROM '/home/ubuntu/labwork/data-files/videos.csv'
 WITH HEADER=TRUE;

 // or - to use in studio:

 INSERT INTO videos (video_id, added_date, Title) VALUES 
  (1645ea59-14bd-11e5-a993-8138354b7e31, '2014-01-29', 'Cassandra History');
 INSERT INTO videos (video_id, added_date, Title) VALUES 
  (245e8024-14bd-11e5-9743-8238356b7e32, '2012-04-03', 'Cassandra & SSDs');
 INSERT INTO videos (video_id, added_date, Title) VALUES 
  (3452f7de-14bd-11e5-855e-8738355b7e3a, '2013-03-17', 'Cassandra Intro');
 INSERT INTO videos (video_id, added_date, Title) VALUES 
  (4845ed97-14bd-11e5-8a40-8338255b7e33, '2013-10-16', 'DataStax Studio');
 INSERT INTO videos (video_id, added_date, Title) VALUES 
  (5645f8bd-14bd-11e5-af1a-8638355b8e3a, '2013-04-16', 'What is DataStax Enterprise?');


 // 11
 SELECT * FROM videos;
 // 12
 SELECT COUNT(*) from videos;  


// Exercise 3
// 7
CREATE TABLE videos_by_tag (
    tag text,
    video_id timeuuid,
    added_date timestamp,
    title text,
    PRIMARY KEY ((tag) video_id)
    );

// 8
 INSERT INTO videos_by_tag (tag, video_id, added_date, Title) VALUES 
  ('cassandra',1645ea59-14bd-11e5-a993-8138354b7e31, '2014-01-29', 'Cassandra History');
 INSERT INTO videos_by_tag (tag, video_id, added_date, Title) VALUES 
  ('cassandra',245e8024-14bd-11e5-9743-8238356b7e32, '2012-04-03', 'Cassandra & SSDs');
 INSERT INTO videos_by_tag (tag, video_id, added_date, Title) VALUES 
  ('cassandra',3452f7de-14bd-11e5-855e-8738355b7e3a, '2013-03-17', 'Cassandra Intro');
 INSERT INTO videos_by_tag (tag, video_id, added_date, Title) VALUES 
  ('datastax',4845ed97-14bd-11e5-8a40-8338255b7e33, '2013-10-16', 'DataStax Studio');
 INSERT INTO videos_by_tag (tag, video_id, added_date, Title) VALUES 
  ('datastax',5645f8bd-14bd-11e5-af1a-8638355b8e3a, '2013-04-16', 'What is DataStax Enterprise?');

// 10
 SELECT * FROM videos_by_tag WHERE tag = 'cassandra';

// 11
 SELECT * FROM videos_by_tag WHERE tag = 'datastax';

// 12
 SELECT * FROM videos_by_tag WHERE Title = 'Cassandra Intro' ALLOW FILTERING;



// Exercise 4