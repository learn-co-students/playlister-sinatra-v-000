class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs


    def slug
        name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        artists = Artist.all
        artists.find {|artist| artist.slug == slug}
    end
end