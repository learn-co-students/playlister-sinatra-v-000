class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    slug = self.name.downcase.split(/\W|\s/).join("-")
  end

  def self.find_by_slug(slug)
    self.all.find{|i| i.slug == slug}
  end
end
