class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    self.name.downcase.gsub(/[[:punct:]]/,'').gsub(/\s/,'-')
  end

  def self.find_by_slug(slug)
    Artist.all.each do |artist|
      return artist if artist.slug == slug
    end
  end
end
