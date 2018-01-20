class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def self.find_by_slug(slug)
    name = slug.split("-").map{|i| i.capitalize }.join(" ")
    Song.find_by(name: "#{name}")
  end

  def slug
    self.name.downcase.split(" ").join("-")
  end

end
