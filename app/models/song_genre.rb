class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre
  def slug
    name.downcase.gsub(" ","-")
  end
end
