require 'pry'

class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres


    def slug
      self.name.to_s.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slugify)
      Song.all.find{|s| s.slug == slugify} #problem is here when s.slug is called
    end

end
