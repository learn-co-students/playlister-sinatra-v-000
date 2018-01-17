class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  # has_many :genres, through: :song_genres

  def slug
    self.name.parameterize
  end

  def self.find_by_slug(slug)
    self.all.detect {|song| song.slug == slug}
  end
end

  # has_many :songs
  # has_many :genres, :through => :songs
