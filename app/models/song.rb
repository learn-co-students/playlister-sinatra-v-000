class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :songs_genres
  has_many :genres, through: :songs_genres

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.detect { |x| x.slug == slug }
  end
end