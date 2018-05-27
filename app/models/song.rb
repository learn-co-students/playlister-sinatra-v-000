class Song < ActiveRecord::Base
  include Slugable::InstanceMethods
  # extend Slugable::ClassMethod

   belongs_to :artist
   has_many  :song_genres
   has_many  :genres, through: :song_genres


   def self.find_by_slug(slug)         # this is not getting the song into it.
           self.all.find do |instance|
             binding.pry
            instance.slug == slug    ## This is the issue,, they not equalling each other...
       end
   end


end
