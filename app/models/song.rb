class Song < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :artist
  has_many :genre, through: :songs_genres

end
