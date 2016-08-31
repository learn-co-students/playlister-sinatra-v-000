class Genre < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end

# Genre.create(name: "Pop")
#   => #<Genre:0x007ff9990c94d8 id: 1, name: "Pop">
