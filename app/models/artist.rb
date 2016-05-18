class Artist < ActiveRecord::Base

  include Slug::Instance
  extend Slug::Class

  has_many :songs
  has_many :genres, through: :songs

end
