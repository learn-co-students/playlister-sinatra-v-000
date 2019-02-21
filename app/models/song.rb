class Song < ActiveRecord::Base

belongs_to :artist
has_many :song_genres
has_many :genres, through: :song_genres


def slug
temp = self.name
temp1 = temp.parameterize
temp1
end

def self.find_by_slug(slug)
self.find{|song| song.slug == slug}
end

end
