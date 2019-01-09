class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, :through => :song_genres
    has_many :artists, :through => :songs
<<<<<<< HEAD

    def slug
        name.downcase.strip.gsub(' ', '-')
    end

    def self.find_by_slug(slug)
        Genre.all.find{|genre| genre.slug == slug }
    end


end
=======
  
    def slug
      name.downcase.gsub(" ","-")
    end
  
    def self.find_by_slug(slug)
      Genre.all.find{|genre| genre.slug == slug}
    end
  end

# class Genre < ActiveRecord::Base
#     has_many :song_genres
#     has_many :songs, :through => :song_genres
#     has_many :artists, :through => :songs
    
#     def slug
#         Genre.name.downcase.gsub(" ","-")
#     end
    
#     def self.find_by_slug(slug)
#         Genre.all.find{|genre| genre.slug == slug}
#     end
# end
>>>>>>> 35330544966daab476d3ed9f8651f4f9b69adddb
