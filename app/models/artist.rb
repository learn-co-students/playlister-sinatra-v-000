class Artist < ActiveRecord::Base
  include Slugifiable
  extend Slugifiable
 has_many :songs
 has_many :genres, through: :songs

end
