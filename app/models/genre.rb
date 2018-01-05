class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    self.name.downcase.split(/\s|\.\W/).join("-")
  end

  def self.find_by_slug(slug)
    self.all.map do |genre|
      return genre if genre.slug == slug
    end.first
  end
end
