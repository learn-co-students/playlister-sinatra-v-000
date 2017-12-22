class SongGenre < ActiveRecord::Base
  
  include Slug
  extend Slug_Cl

  belongs_to :genre
  belongs_to :song
end
