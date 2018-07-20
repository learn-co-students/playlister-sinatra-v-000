class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    slug = self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    slug = slug.split("-")
    slug.collect do |word|
      word.capitalize!
    end
    slug = slug.join(" ")
    self.find_by_name(slug)
  end
end
