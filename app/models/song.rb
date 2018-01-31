class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.split.collect do |word|
      word.downcase.gsub(/\W/,"")
    end.join("-")
  end

  def self.find_by_slug(slug)
    Song.all.select do |artist|
      artist.slug == slug
    end[0]
  end

end
