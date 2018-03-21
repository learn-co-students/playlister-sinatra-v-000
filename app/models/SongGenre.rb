class SongGenre < ActiveRecord::Base
  has_many :songs
  has_many :genres
  def slug
    name.downcase.gsub(" ","-")
  end
end
