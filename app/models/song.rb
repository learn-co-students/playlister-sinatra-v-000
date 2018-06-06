class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres
    #extend Concerns::Slugifiable

    def slug
        self.name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        song = slug.split("-").collect do |name|
            name.capitalize
        end.join(" ")
        @song = self.find_by(:name => song)
    end
end
