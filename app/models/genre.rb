class Genre < ActiveRecord::Base
  belongs_to :songs
  has_many :songs
  has_many :artits, through: :songs
end
