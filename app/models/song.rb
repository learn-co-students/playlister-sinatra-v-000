class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres
  
  def slug
    self.name.gsub(" ","-").downcase
  end
  
  def self.find_by_slug(slug)
    self.all.find do |song|
      slug == song.slug
    end
  end
end