require 'pry'
class Genre<ActiveRecord::Base
has_many :song_genres
has_many :songs,through: :song_genres
has_many :artists, through: :songs

def slug
  name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
end

def self.find_by_slug(param)
Genre.all.find{|g| g.slug == param}
end
end
