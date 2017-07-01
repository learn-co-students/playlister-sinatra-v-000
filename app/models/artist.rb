class Artist < ActiveRecord::Base
  include Slugifable
  has_many :songs
  has_many :genres, through: :songs
end
