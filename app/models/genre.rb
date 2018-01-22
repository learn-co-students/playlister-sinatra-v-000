class Song < ActiveRecord::Base
  has_many :Artist
  has_many :Song
end
