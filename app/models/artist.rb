class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
   def slug
    #strip string and downcase
    slug = self.name.downcase.strip
     #get rid of apostrophes
    slug.gsub! /['`]/,""
     #@ --> at, and & --> and
    slug.gsub! /\s*@\s*/, " at "
    slug.gsub! /\s*&\s*/, " and "
     #replace all non alphanumeric, underscore or periods with underscore
     slug.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '-'
      #convert double underscores to single
     slug.gsub! /_+/,"-"
      #strip off leading/trailing underscore
     slug.gsub! /\A[_\.]+|[_\.]+\z/,""
      slug
  end
   def self.find_by_slug(slug)
    found = Artist.all.find {|s| s.slug == slug}
    found
  end
 end
