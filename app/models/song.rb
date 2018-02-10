class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def slug
    song = self.name
    "#{song.gsub(/\W/, "-").squeeze("-")}".downcase
  end

  def self.find_by_slug(slug)
    name_array = slug.split("-")
    name_array.collect do |word|
      word.capitalize!
    end
    slug = name_array.join("-")
    @song = Song.find_by name: slug.sub("-", " ")
  end
end
