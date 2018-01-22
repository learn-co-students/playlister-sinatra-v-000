class Song < ActiveRecord::Base
  belongs_to :Artist
  has_many :Song
end
