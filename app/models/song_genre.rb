class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre

  include Slugifiable::Instance
  extend Slugifiable::Class
end
