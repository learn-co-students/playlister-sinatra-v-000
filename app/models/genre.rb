class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    name.downcase.scan(/\w|\d|[ ]/).join.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Genre.all.find{|genre| genre.slug == slug}
  end
end
