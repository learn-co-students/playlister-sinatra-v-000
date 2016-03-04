class Song < ActiveRecord::Base

  belongs_to :artist 
  has_many :songs_genres
  has_many :genres, through: :songs_genres

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    unslug = slug.split("-").join(" ")
    self.all.detect do |song|
      song.name.downcase == unslug
    end
  end
end