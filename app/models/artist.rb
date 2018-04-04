require 'pry'
class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs


    def slug
      #"Hotline Bling" => hotline-bling
      name.downcase.split(/\s*\W/).join("-")
    end

    def self.find_by_slug(slug)
      #binding.pry
      Artist.all.find {|artist| artist.slug == slug}
    end

end
