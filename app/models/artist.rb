class Artist < ActiveRecord::Base
  attr_accessor :slug

  has_many :songs
  has_many :genres, through: :songs

  def slug
    @slug = self.name.downcase
    if @slug.split.size >1
      @slug.split.join("-")
    end
    #self.slug = @slug
  end

  def self.find_by_slug(slug)
    @artist = Artist.all.find do |a|
      a.slug == slug
    end
  end

end
