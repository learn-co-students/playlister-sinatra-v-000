class Genre < ActiveRecord::Base
include Slugifiable


has_many :artists, through: :songs
has_many :song_genres
has_many :songs, through: :song_genres

def self.find_by_slug(name)
  self.all.detect do |i|
    i.slug == name
  end
end

end
