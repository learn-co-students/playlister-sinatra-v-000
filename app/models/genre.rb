class Genre < ActiveRecord::Base
has_many :song_genres
has_many :songs, through: :song_genres
has_many :artists, through: :songs


    def slug
        self.name.squish.downcase.tr(" ","-")
    end

    def self.find_by_slug(slug)
        found = nil
        Genre.all.each do |genre|
            found = genre if genre.slug == slug
        end
        found
    end

end
