class Genre < ActiveRecord::Base
    has_many :artists, through: :songs
    has_many :song_genres
    has_many :songs, through: :song_genres

    #def self.slug
    #    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    #end

    def slug
        self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def self.find_by_slug(slug)
        self.all.detect {|i| i.slug == slug}
    end
end
