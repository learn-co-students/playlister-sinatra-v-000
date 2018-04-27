class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(song_name)
    Song.all.find do |song|
      song.name.downcase == song_name.gsub('-', ' ')
    end
  end

end
