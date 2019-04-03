class SongGenre < ActiveRecord::Base
  belongs_to :genre
  belongs_to :song

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    SongGenre.all.find { |song| song.slug == slug }
  end
end
