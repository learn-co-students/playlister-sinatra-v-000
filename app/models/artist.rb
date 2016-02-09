class Artist < ActiveRecord::Base
  
  include Slugifiable::InstanceMethods
  has_many :songs
  has_many :genres, through: :songs

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