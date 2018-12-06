class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre


  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    self.all.find {|song_genre| song_genre.slug == slug}
  end

end
