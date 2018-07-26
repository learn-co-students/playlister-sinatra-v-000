class Song_Genre < ActiveRecord::Base
  belongs_to :genre
  belongs_to :song
end
