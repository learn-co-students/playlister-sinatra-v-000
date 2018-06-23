class Artist < ActiveRecord::Base
  has_many :genres, through: :songs
  has_many :songs

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

	

end