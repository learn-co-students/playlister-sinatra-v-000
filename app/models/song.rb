class Song < ActiveRecord::Base
  has_many :genres
  belongs_to :artist
end
