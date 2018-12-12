class Genre < ActiveRecord::Base
  extend Slug::ClassMethods
  include Slug::InstanceMethods

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

end
