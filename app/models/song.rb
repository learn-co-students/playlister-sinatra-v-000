class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.split(' ').join('-').downcase.chomp
  end

  def self.find_by_slug(song_name)
    find_by(name: song_name.split(' ').join(' ').titleize)
  end
end
