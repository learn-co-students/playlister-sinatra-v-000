class Genre < ActiveRecord::Base

has_many :song_genres
has_many :songs, through: :song_genres
has_many :artists, through: :songs

def slug
temp = self.name
temp1 = temp.parameterize
temp1
end

def self.find_by_slug(slug)
self.find{|genre| genre.slug == slug}
end

end
