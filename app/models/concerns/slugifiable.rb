module Slugify

    module ClassMethods

        # use the slug method 
        # retrieve a song/artist/genre from the database
        # return that entry

        def self.find_by_slug(slug_name)
        end
    end
    
    module InstanceMethods

        #takes a given song/artist/genre name 
        #create the "slugified" version
        def slug(name)
        end

    end
end