class Song < ActiveRecord::Base
  has_many :song_genres
    belongs_to :artist
    has_many :genres, through: :song_genres

      def slug
          self.name.squish.downcase.tr(" ","-")
      end

      def self.find_by_slug(slug)
          found = nil
          Song.all.each do |song|
              found = song if song.slug == slug
          end
          found
      end 

end
