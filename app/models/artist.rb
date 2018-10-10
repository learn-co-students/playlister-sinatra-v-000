class Artist < ActiveRecord::Base
  include Slugifiable
  extend Slugifiable::ClassMethod
  has_many :songs

  has_many :genres, through: :songs
end
