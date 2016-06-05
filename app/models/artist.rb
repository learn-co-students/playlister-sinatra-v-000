class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :song_genres

  extend Slugifiable::InstanceMethods
  include Slugifiable::ClassMethods
end
