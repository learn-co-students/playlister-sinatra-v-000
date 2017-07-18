class Artist < ActiveRecord::Base

  validates :name, presence: true

  has_many :songs
  has_many :genres, through: :songs

  extend Sluggable::ClassMethods
  include Sluggable::InstanceMethods

end