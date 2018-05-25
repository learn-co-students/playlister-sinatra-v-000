class Genre < ActiveRecord::Base
    include Slugable::InstanceMethods  # change aritst from b1 to b-1
   #  extend Slugable::ClassMethod

    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def self.find_by_slug(slug)
        self.all.find do |instance|
         instance.slug == slug

   end
   end

end
