class Genre < ActiveRecord::Base
has_many :song_genres
has_many :songs, through: :song_genres
has_many :artists, through: :songs

def slug
  name.downcase.gsub(' ', '-')
end

def self.find_by_slug(slugified)
  Genre.all.find { |name| name.slug == slugified }
end
end
