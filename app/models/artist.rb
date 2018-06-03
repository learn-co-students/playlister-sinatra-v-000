class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        self.name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        artist = slug.split("-").collect do |name|
            name.capitalize
        end.join(" ")
        @artist = self.find_by(:name => artist)
    end
end
