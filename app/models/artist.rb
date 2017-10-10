class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    self.name.downcase.gsub(' ','-')
  end

  def self.find_by_slug(slug)
    Artist.all.detect do |artist|
      slug == artist.slug
    end
  end

end
