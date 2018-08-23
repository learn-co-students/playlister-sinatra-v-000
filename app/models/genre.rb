class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :songs
end
