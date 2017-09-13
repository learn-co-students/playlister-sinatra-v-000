class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  include Slugifiable::InstanceMethod
  extend Slugifiable::ClassMethod
end
