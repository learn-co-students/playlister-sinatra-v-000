class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres
  has_many :song_genres
  @@slugs = {}

  def slug
    slug = self.name.downcase.gsub(" ","-")
    @@slugs[slug] = self.name
    slug
  end

  def self.find_by_slug(slug)
      self.find_by(name: @@slugs[slug])
  end
end
