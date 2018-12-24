class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    camel_slug = self.name.gsub! " ", "-"
    camel_slug.downcase
  end

  def self.find_by_slug(slug)
    name = slug.gsub! "-", " "
    matching_song = Song.find{ |song| song.name.downcase == name }
  end
end
