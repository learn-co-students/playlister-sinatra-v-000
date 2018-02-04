class Artist < ActiveRecord::Base
  include Slug_Mod
  extend Find_By_Slug_Mod
  has_many :songs
  has_many :genres, through: :songs
end
