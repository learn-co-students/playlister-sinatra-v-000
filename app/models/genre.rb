class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.strip.gsub(" ", "-")
  end

  def find_by_slug
  end

end
