class Genre < ActiveRecord::Base

  has_many :artists, through: :songs
  has_and_belongs_to_many :songs


end
