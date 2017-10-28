class SongGenre < ActiveRecord::Base
  belongs_to :song 
  belongs_to :genre
  
  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug
    SongGenre.all.find { |song_genre| song_genre.slug == slug}
  end

end