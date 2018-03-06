class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artits, through: :songs
end
