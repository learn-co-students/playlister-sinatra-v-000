class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def slug
    song = self.name
    "#{song.gsub(/\W/, "-").squeeze("-")}".downcase
  end

  def self.find_by_slug(slug)
    @song = Song.find_by slug: slug
    #binding.pry
    @song
  end


end
