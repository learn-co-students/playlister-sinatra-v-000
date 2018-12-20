require_relative './concerns/slugifiable.rb'
class Genre < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  has_many :songs_genres
  has_many :songs, through: :songs_genres
  has_many :artists, through: :songs
end