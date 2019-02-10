
class SongGenre < ActiveRecord::Base
  #include slug
  belongs_to :song
  belongs_to :genre

end
