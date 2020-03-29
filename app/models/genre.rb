class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        name = self.name.downcase
        name_array = name.split(" ")
        slug = name_array.join("-")
        slug
    end 

    def self.find_by_slug(slug)
        @name = slug.split("-").join(" ").titleize()
        Genre.all.find {|x| x.name.downcase == @name.downcase}
    end 

end 