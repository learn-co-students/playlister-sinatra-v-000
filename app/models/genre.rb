class Genre < ActiveRecord::Base
  require_relative '../models/concerns/slugifiable.rb'
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  has_many :artists, :through => :songs
  has_many :songs, :through => :song_genres
  has_many :song_genres
end