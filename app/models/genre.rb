class Genre  < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    songs = []
    slug.split("-").each {|phrase| songs << phrase.capitalize}
    find_by(name: songs.join(" "))
  end

end
