class Song_Genre < ActiveRecord::Base[5.1]
  belongs_to :song
  belongs_to :genre
end