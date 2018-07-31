class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        self.name.downcase.gsub(/[^a-z0-9]/i, "-")
    end

    def self.find_by_slug(slug)
        self.all.find do |song|
            song.slug == slug
        end
    end

end