class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :genres, through: :song_genres 
    has_many :song_genres

    def slug
        self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def self.find_by_slug(slug)
        Song.all.find{|song| song.slug == slug}
    end
end