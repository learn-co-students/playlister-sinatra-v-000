class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres
  has_many :song_genres

  def slug
    name.parameterize
  end

  def self.find_by_slug(slug)
    self.all.detect {|i| i.name.parameterize == slug}
  end
end
