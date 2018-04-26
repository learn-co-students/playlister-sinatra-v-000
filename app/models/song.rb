class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(song_name)
    song = Song.find_by_name(song_name.gsub('-', ' ').split(" ").map(&:capitalize).join(" "))
  end

end
