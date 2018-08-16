class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slugged)
    Artist.all.find do |artist|
      artist.slug == slugged
    end
  end
end
