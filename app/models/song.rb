class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.split(" ").collect {|word| word.downcase}.join("-")
  end

  def self.find_by_slug(slug)
    self.where("lower(name) = ?", slug.split("-").join(" ").downcase).first
    #.split("").drop(1).join("")
  end

end
