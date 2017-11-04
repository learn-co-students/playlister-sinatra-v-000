  class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
      @artist = self.name.gsub(' ','-').downcase
      self.slug = @artist
      @artist
    end

    def self.find_by_slug(slug)
      self.all.find do |artist|
        artist.slug == slug
      end
    end
  end
