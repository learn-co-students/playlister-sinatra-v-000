class Genre < ActiveRecord::Base
  has_many :songs, through: :song_genres
  has_many :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.split(' ').join('-').downcase.chomp
  end

  def self.find_by_slug(genre_name)
    find_by(name: genre_name.split('-').join(' ').titleize)
  end
end
