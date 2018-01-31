class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres

  def slug
    self.name.split.collect do |word|
      word.downcase.gsub(/\W/,"")
    end.join("-")
  end

  def self.find_by_slug(slug)
    Genre.all.select do |artist|
      artist.slug == slug
    end[0]
  end

end
