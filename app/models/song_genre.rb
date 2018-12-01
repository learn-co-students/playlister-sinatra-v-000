class SongGenre < ActiveRecord::Base
  require 'pry'
  #binding.pry
  belongs_to :song
  belongs_to :genre

end
