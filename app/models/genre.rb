class Genre < ActiveRecord::Base
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods
  has_many :songs, through: :song_genres## << really smart attr_accessor
  has_many :artists, through: :songs
  has_many :song_genres
end
