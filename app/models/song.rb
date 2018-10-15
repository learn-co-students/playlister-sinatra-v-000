class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
   def slug
    #strip string and downcase
    slug = self.name.downcase.strip
     #get rid of apostrophes
    slug.gsub! /['`]/,""
     #@ --> at, and & --> and
    slug.gsub! /\s*@\s*/, " at "
    slug.gsub! /\s*&\s*/, " and "
     #replace all non alphanumeric, underscore or periods with hyphen
     slug.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '-'
      #convert double underscores to hyphen
     slug.gsub! /_+/,"-"
      #strip off leading/trailing underscore
     slug.gsub! /\A[_\.]+|[_\.]+\z/,""
      slug
  end
   def self.find_by_slug(slug)
    found = Song.all.find {|s| s.slug == slug} #works in pry, why not able to call?
    found
  end
 end 
