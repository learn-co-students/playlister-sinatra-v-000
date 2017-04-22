
class Artist < ActiveRecord::Base

  include Concerns::Slugifiable
  extend Concerns::Slugifiable

  has_many :songs
  has_many :genres, through: :songs
end