class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs
    
    def slug
        self.name.downcase.split(' ').join('-')
    end

    def self.find_by_slug(slug)
        @all_artist_info = []
        self.all.each do |artist|
            if artist.slug == slug
                @all_artist_info << artist
            end
        end 
        @all_artist_info[0]
    end 
end