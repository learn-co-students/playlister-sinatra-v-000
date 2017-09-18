class Genre < ActiveRecord::Base
  has_many :song_genres #Remember to include 'has_many' with the join table!
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    Sligify(@name)
  end
end
