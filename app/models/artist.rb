class Artist < ActiveRecord::Base
  include Slugifiable
  extend MetaSlugifiable
  has_many :songs
  has_many :genres, through: :songs

end