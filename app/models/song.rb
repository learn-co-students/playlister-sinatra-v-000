
class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def slug
    self.name.downcase.gsub(/ /, '-')
  end

  def self.find_by_slug(slug)
    name = slug.split('-').map {|x| x.capitalize}.join(' ')
    song = Song.find_by(:name => name)
    song
  end

end