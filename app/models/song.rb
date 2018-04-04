class Song < ActiveRecord::Base
  belongs_to :artist #belongs to ONE artist
  has_many :song_genres
  has_many :genres, through: :song_genres


  def slug
    #"Hotline Bling" => hotline-bling
    name.downcase.split(/\s*\W/).join("-")
  end

  def self.find_by_slug(slug)
    #binding.pry
    Song.all.find {|song| song.slug == slug}
  end

end
