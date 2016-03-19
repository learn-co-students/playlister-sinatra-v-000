class Artist < ActiveRecord::Base
  extend Sluggifiable::ClassSlug
  include Sluggifiable::InstanceSlug
  has_many :songs
  has_many :genres, through: :songs

end