class Artist < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  #has multiple songs
  #has multiple genres
  has_many :songs
  has_many :genres, through: :songs

end
