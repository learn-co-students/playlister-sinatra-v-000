class Artist < ActiveRecord::Base

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  has_many :songs
  has_many :genres, through: :songs

  validates_presence_of :name
end
