class Artist < ActiveRecord::Base
  has_many :Artists
  has_many :genres, :through => :Artists

  def slug
    artist = self.name
    "#{artist.gsub(/\W/, "-").squeeze("-")}".downcase
  end

  def self.sluggify(name)
    Artist.all.detect do |artist|
      if artist.slug == name
        self.find_by_name(artist.name)
        @artist
      else
        @artist = nil
      end
    end
  end

  def self.find_by_name(name)
    @artist = Artist.find_by name: name
  end

  def self.find_by_slug(slug)
    self.sluggify(slug)
  end

end
