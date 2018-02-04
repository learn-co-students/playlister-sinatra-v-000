class Genre < ActiveRecord::Base
  extend Concerns::Slugifiable

  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    self.name.downcase.gsub(" ", "-")
  end
  
end
