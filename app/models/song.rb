class Song < ActiveRecord::Base
  has_many :song_genres
  belongs_to :artist
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    song_name = slug.gsub("-", " ")
    Song.all.find {|song| song.name.downcase == song_name }
  end
end
