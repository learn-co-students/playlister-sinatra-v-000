class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre

  def song_genres

  end

end
