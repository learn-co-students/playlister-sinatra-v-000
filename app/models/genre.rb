class Genre < ActiveRecord::Base
  has_many :artists
  has_many :genres
end
