class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre
end

# An instance of SongGenre belongs to a song instance and belongs to a genre instance
# SongGenre class is mapped to the song_genres join table that enacts the Many-To-Many relationship, which shows that:
# 1 genre instance has many song instances, and 1 song instance can have many, (i.e. belong to many) genre instances
# 1 genre instance has many song instances via song_genres join table (i.e. via the many songgenre instances that belong to it)
# 1 song instance has many (belongs to many) genre instances via song_genres join table (i.e. via the many songgenre instances that belong to it)
# The class declaring the belongs_to relationship gets the foreign key column(s), so
# the song_genres join table will have song_id and genre_id foreign key columns
