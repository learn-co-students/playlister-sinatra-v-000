class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, :through => :song_genres
<<<<<<< HEAD

    def slug
        name.downcase.strip.gsub(' ', '-')
    end

    def self.find_by_slug(slug)
        Song.all.find{|song| song.slug == slug }
    end

end
=======
  
    def slug 
      name.downcase.gsub(" ","-")
    end
  
    def self.find_by_slug(slug)
      Song.all.find{|song| song.slug == slug}
    end
  end
# class Song < ActiveRecord::Base
#     belongs_to :artist
#     has_many :song_genres
#     has_many :genres, :through => :song_genres

#     #Why do we need Song.name but the solution only uses name?
#     def slug 
#         Song.name.downcase.gsub(" ","-")
#     end
    
#     def self.find_by_slug(slug)
#         Song.all.find{|song| song.slug == slug}
#     end
# end
>>>>>>> 35330544966daab476d3ed9f8651f4f9b69adddb
