class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    name = slug.gsub("-", " ").split(" ").map {|f| f.capitalize}.join(" ")
    self.where("lower(name) = ?", name.downcase).first
  end
end

