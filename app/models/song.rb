class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  
  def slug
    self.name.split(' ').map { |i| i.downcase}.join('-')
  end
  
  def self.find_by_slug(slug)
    Song.all.find do |song|
      song.slug == slug
    end
  end
end