class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def slug
    song = self.name
    "#{song.gsub(/\W/, "-").squeeze("-")}".downcase
  end

  def self.sluggify(name)
    Song.all.detect do |song|
      if song.slug == name
        self.find_by_name(song.name)
        @song
      else
        @song = nil
      end
    end
  end

  def self.find_by_name(name)
    @song = Song.find_by name: name
  end

  def self.find_by_slug(slug)
    self.sluggify(slug)
  end
end
