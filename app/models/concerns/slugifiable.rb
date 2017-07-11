module Slugify

    module ClassMethods

        # use the slug method 
        # retrieve a song/artist/genre from the database
        # return that entry

        def find_by_slug(slugged)
            found = []
            self.all.each {|obj|
                if slugged == obj.slug
                    found << obj
                end
            }
            found[0]
        end
    end
    
    module InstanceMethods

        #takes a given song/artist/genre name 
        #create the "slugified" version
        def slug
            binding.pry
            downcased = self.name.downcase
            dasherized = downcased.gsub(/[\s,]+/,"-")
        end

    end
end