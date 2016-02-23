class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs 

  extend Slugifiable
  include Slugifiable

end

# Artist
#   can be initialized (FAILED - 33)
#   can have a name (FAILED - 34)
#   has many songs (FAILED - 35)
#   can have many genres (FAILED - 36)
#   can slugify it's name (FAILED - 37)
#   Class methods
#     given the slug can find a Artist (FAILED - 38)