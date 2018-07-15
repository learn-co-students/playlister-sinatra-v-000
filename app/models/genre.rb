class Genre < ActiveRecord::Base
  has_many :song_genres                     # connection between songs & genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs        # songs can only have one artist

  extend Slugify::ClassMethods
  include Slugify::InstanceMethods
end
