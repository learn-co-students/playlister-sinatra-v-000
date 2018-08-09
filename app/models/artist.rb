class Artist < ActiveRecord::Base
has_many :songs
has_many :genres, through: :songs
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
