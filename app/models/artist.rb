class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  # def name=(s)
  #   write_attribute(:name, s.to_s.titleize)
  # end
end
