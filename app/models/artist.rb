class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def self.slug

  end

end
