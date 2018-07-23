
class Genre < ActiveRecord::Base
  has_many :artists
  has_many :songs, through: :artists
end