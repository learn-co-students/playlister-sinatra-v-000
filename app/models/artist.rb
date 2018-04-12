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
    slug = slug.split("-").map.each do |s|
      s.capitalize
    end
    @artist = Artist.find_by_name(slug.join(" "))
  end

end
