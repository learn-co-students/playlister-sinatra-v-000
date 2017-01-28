class Artist < ActiveRecord::Base
  include Concerns::Slugifiable
  extend Concerns::Findable

  has_many :songs
  has_many :genres, through: :songs
end
