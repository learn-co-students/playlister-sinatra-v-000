class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    #binding.pry
    self.name.gsub(/\s/, "-").downcase
  end

  def self.find_by_slug(slug)
    #binding.pry
    Genre.all.find{|genre| genre.slug == slug}
  end
end
