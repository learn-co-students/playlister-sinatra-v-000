class Song < ActiveRecord::Base
  extend Concerns::Slugifiable

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.gsub(" ", "-")
  end
  
end
