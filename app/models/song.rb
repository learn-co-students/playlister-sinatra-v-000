class Song < ActiveRecord::Base
  has_one :artists
  has_many :pets
end
