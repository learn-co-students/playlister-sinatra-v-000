class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
  end

  #use slug method to retrieve name from database
  def self.find_by_slug(slug)
    Artist.all.find{|artist| artist.slug == slug}
  end
end
