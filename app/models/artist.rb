class Artist < ActiveRecord::Base

  include Slugifiable
  extend FindBySlug  

  has_many :songs
  has_many :genres, :through => :songs
end