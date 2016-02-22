class Genre < ActiveRecord::Base
  has_many :songs_genres
  has_many :songs, through: :songs_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.detect { |x| x.slug == slug }
  end
end