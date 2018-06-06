class Genre < ActiveRecord::Base
    has_many :artists, through: :songs
    has_many :song_genres
    has_many :songs, through: :song_genres

    def slug
        self.name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        genre = slug.split("-").collect do |name|
            if name == "with" || name == "the" || name == "a"
                 name.downcase
             else
                 name.capitalize
             end
             end.join(" ")
        
        @genre = self.find_by(:name => genre)
    end

end
