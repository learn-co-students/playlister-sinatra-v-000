class Artist < ActiveRecord::Base
  extend Slugifiable
  include Slugifiable
  has_many :songs
  has_many :genres, through: :songs
end
