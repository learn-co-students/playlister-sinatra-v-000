class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
end
