class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.downcase.gsub(/[\s]/, '-')
  end

  def self.find_by_slug(slug)
    Artist.all.find do |artist| #iterates through all artists, calls slug method on each artist instance and returns slug if it matches 
      artist.slug == slug
    end
  end

end
