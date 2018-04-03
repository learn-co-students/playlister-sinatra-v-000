class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    Slugifiable.new(name).slug
  end

  def self.find_by_slug(slug)
    name = slug.gsub("-", " ")
    Song.all.find{|s| s.name.downcase == name}
  end
  
end
