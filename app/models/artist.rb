require_relative './concerns/slugifiable'

class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, :through => :songs
<<<<<<< HEAD

    def slug
        name.downcase.strip.gsub(' ', '-')
    end

    def self.find_by_slug(slug)
        Artist.all.find{|artist| artist.slug == slug }
    end




end
=======
  
  # We are repeating a ton of code here. These two methods could go into a module.
  
    def slug
      name.downcase.gsub(" ","-")
    end
  
    def self.find_by_slug(slug)
      Artist.all.find{|artist| artist.slug == slug}
    end
  end
# class Artist < ActiveRecord::Base
#     has_many :songs
#     has_many :genres, :through => :songs
    
#     def slug
#         Artist.name.downcase.gsub(" ","-")
#     end
    
#     def self.find_by_slug(slug)
#         Artist.all.find{|artist| artist.slug == slug}
#     end
  
# end
>>>>>>> 35330544966daab476d3ed9f8651f4f9b69adddb

    