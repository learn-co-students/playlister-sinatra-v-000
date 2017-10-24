class SongGenre < ActiveRecord::Base
  belongs_to :genre #belongs_to always takes singular!
  belongs_to :song
end

#where there is a many-to-many relationship of A to B without intermediary, create a composite class AB, such that A has many ABs and B has many ABs, and AB belongs to both A and B.
