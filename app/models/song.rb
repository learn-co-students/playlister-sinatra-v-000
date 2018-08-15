class Song < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :artist
  has_many :genres, through: :song_genres
end
