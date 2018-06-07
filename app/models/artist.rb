class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.split(' ').join('-').downcase.chomp
  end

  def self.find_by_slug(artist_name)
    find_by(name: artist_name.split('-').join(' ').titleize)
  end
end
