class Artist < ActiveRecord::Base

   include Slugable::InstanceMethods
    has_many :songs
    has_many :genres, through: :songs

     def self.find_by_slug(slug)
         self.all.find do |instance|
          instance.slug == slug
     end
    end

end
