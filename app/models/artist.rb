class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.gsub(/\W/, '-').downcase
  end

  def self.find_by_slug(slug)
    self.all.find do |artist|
      artist.slug == slug
    end
   
  end
end