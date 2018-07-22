class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres

  def slug
    name.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
  end

  #use slug method to retrieve name from database
  def self.find_by_slug(slug)
    Song.all.find{|artist| artist.slug == slug}
  end
end
