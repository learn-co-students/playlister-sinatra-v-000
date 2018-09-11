class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        name = self.name
        slugged = name.downcase.gsub(" ", '-')
        slugged
    end

    def self.find_by_slug(slug)
        artist_name = slug.split('-').map{|word| word.capitalize}.join(" ")
        object = self.find_by(:name=>artist_name)
        object
    end
end