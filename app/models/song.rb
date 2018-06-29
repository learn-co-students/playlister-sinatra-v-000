class Song < ActiveRecord::Base

    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        self.name.parameterize
    end

    # perguntar pro Dan what's going on... This methods works on my browser, however I'm not able to pass the test.
    # def self.find_by_slug(slug)
    #     name = slug.gsub(/-/, " ").titleize
    #     Artist.all.find_by(name: name)
    # end


    def self.find_by_slug(slug)
        Song.all.find{|song| song.slug == slug}
    end

end