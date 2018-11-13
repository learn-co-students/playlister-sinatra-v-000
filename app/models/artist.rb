class Artist < AbstractSluggable #ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

end
