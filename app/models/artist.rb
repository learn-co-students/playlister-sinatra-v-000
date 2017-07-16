class Artist < ActiveRecord::Base
  has_many :songs, :genres
end
