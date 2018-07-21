class Genre < ActiveRecord::Base
  has_many :artists, :through => :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    slug = self.name.downcase.split(/\W|\s/).join("-")
  end

  def self.find_by_slug(slug)
    self.all.find {|i| i.slug == slug}
  end

end
