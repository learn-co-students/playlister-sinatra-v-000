module Slugifiable
  module InstanceMethods
    def slug
      #strip out any special characters, and replace all spaces with `-`. For a song, artist and genre
      slug = song.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
  end
  #<#Artist>.slug

  module ClassMethods
    def find_by_slug(slug)
      #uses the `slug` method to retrieve a song/artist/genre from the database and return that entry
    end
  end
  #Artist.find_by_slug(:slug)
end
