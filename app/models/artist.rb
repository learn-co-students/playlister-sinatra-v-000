class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

    def slug
      name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug) #use find
      self.all.find do |song|
        if song.slug == slug
          @song = song
          end
        end
        @song
      end

end
