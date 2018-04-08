class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        self.name.split(/ |\_|\-/).map(&:downcase).join("-")
    end

    def self.find_by_slug(artist_name)
        Artist.all.each do |artist|
            if artist.slug == artist_name
                return artist
            end
        end
    end


end