class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres, through: :song_genres
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
