class Artist < ActiveRecord::Base
  include Slugifiable
  has_many :songs
  has_many :genres, through: :songs

  after_initialize :add_slug


end
