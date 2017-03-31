class Artist < ActiveRecord::Base
  extend Slugifiable::SlugClass
  include Slugifiable::SlugInstance
  has_many :songs
  has_many :genres, through: :songs
end
