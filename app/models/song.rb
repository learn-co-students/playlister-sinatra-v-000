class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres #Remember to include 'has_many' with the join table!
  has_many :genres, through: :song_genres
  def slug
    Sligify(@name)
  end
end
