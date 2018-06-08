class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.split(' ').join('-').downcase.chomp
  end

  def self.find_by_slug(artist_name)
    Artist.all.detect{|a| a.slug == artist_name}
  end
end
