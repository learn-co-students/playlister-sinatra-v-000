class Genre < ActiveRecord::Base
  belongs_to :songs
  belongs_to :artists
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.split(" ").join("-").downcase
  end

  def self.find_by_slug(slug)
    Genre.find_by(name: slug.split("-").collect{|s| s.capitalize}.join(" "))
  end
end
