class Genre < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

    def self.find_by_slug(slug)
      found = nil
      self.all.each do |element|
        if element.slug == slug
          found = element
        end
      end
      found
    end
end