class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  def slug
    slug = self.name.strip.downcase

    #blow away apostrophes
    slug.gsub! /['`]/,""

    # @ --> at, and & --> and
    slug.gsub! /\s*@\s*/, " at "
    slug.gsub! /\s*&\s*/, " and "

    #replace all non alphanumeric, underscore or periods with hyphen
     slug.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '-'

     #convert double hyphens to single
     slug.gsub! /-+/,"-"

     #strip off leading/trailing hyphens
     slug.gsub! /\A[-\.]+|[-\.]+\z/,""

     slug
  end

  def self.find_by_slug(slug)
    self.all.find { |genre| genre.slug == slug}
  end
end
