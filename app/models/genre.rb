class Genre < ActiveRecord::Base
  has_many :songs
  belongs_to :artists
end
