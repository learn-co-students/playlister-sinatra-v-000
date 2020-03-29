class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        name = self.name.downcase
        name_array = name.split(" ")
        slug = name_array.join("-")
        slug
    end 

    def self.find_by_slug(slug)
        @name = slug.split("-").join(" ").titleize()
        Artist.all.find {|x| x.name.downcase == @name.downcase}
    end 
end 