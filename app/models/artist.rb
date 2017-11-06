  class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
      if self.name
      slugger = self.name.gsub(' ','-').downcase
      @slug = slugger.gsub(/^[-]\W/,'')
      self.slug = @slug
      @slug
  
      end
    end

    def self.find_by_slug(slug)
    Artist.all.find do |artist|
        artist.slug == slug
      end
    end
  end
