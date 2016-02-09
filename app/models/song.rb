class Song < ActiveRecord::Base
  #include Slugifiable
  #extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

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