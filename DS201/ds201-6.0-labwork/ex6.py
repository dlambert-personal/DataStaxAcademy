
from cassandra.cluster import Cluster
cluster = Cluster(protocol_version = 3)
session = cluster.connect('killrvideo')

print('{0:12} {1:40} {2:5}'.format('Tag', 'ID', 'Title'))
for val in session.execute("select * from videos_by_tag"):
    print('{0:12} {1:40} {2:5}'.format(str(val[0]), str(val[2]), str(val[3])))

cmd = "INSERT INTO videos_by_tag (tag, video_id, added_date, Title) VALUES "
cmd += "('cars',96d9d7a2-5bc5-4e50-8903-5836943a2bde, '2021-12-30', 'JDM powered Sprite');"
session.execute(cmd)

print('')
print('{0:12} {1:40} {2:5}'.format('Tag', 'ID', 'Title'))
for val in session.execute("select * from videos_by_tag"):
    print('{0:12} {1:40} {2:5}'.format(str(val[0]), str(val[2]), str(val[3])))

cmd = "DELETE FROM videos_by_tag "
cmd += "WHERE tag = 'cars' and video_id = 96d9d7a2-5bc5-4e50-8903-5836943a2bde;"
session.execute(cmd)

print('')
print('{0:12} {1:40} {2:5}'.format('Tag', 'ID', 'Title'))
for val in session.execute("select * from videos_by_tag"):
    print('{0:12} {1:40} {2:5}'.format(str(val[0]), str(val[2]), str(val[3])))