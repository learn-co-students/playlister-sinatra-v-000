class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres

end
