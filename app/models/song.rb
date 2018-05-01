class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, :through => :song_genres
  belongs_to :artist

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(id = nil, name = nil)
    Song.find_by(id = nil, name = nil)
  end


end
