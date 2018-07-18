class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.strip.gsub(" ", "-")
  end

  def find_by_slug
  end

end
