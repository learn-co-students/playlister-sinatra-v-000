module Slugifiable
  module ClassMethods
    def find_by_slug(slugified_name)
      self.all.find {|instance| instance.slug == slugified_name}
    end


    # this version of find_by_slug, below, doesn't appear to work. It appears to return the correct object, but the attributes aren't accessible.  hold for later testing
    # def find_by_slug(slugified_name)
    #   # takes slug name, returns corresponding Artist object from database
    #   test1 = self.where("LOWER(name) = ?", slugified_name.gsub("-", " "))
    #   binding.pry
    # end
  end

  module InstanceMethods
    def slug
      name.downcase.gsub(" ","-")
    end
  end
end

# Each class you build will need to have a method to slugify each object's name. This means you'll need to strip
# out any special characters, and replace all spaces with -.
# You'll need to build a method slug which takes a given song/artist/genre name and create the "slugified" version.
# The find_by_slug method should use the slug method to retrieve a song/artist/genre from the database and return
# that entry.


# gsub("MD|M\\.D\\.|PHD", "", test)  # target specific strings
# gsub("\\,.+$", "", test)        # target all characters after comma
# @techiferous, Yeah, I forgot to allow "%" escaped characters. It should've looked more like:
#  /^([!#$&-;=?-[]_a-z~]|%[0-9a-fA-F]{2})+$/
