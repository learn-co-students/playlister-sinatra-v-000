class Artist < ActiveRecord::Base
has_many :songs
has_many :genres, through: :songs

def slug
temp = self.name
temp1 = temp.parameterize
temp1
end

def self.find_by_slug(slug)
self.find{|artist| artist.slug == slug}
end

end
