module Slugifiable
  module InstanceMethods
    def slug
      name_array = self.name.split(" ")
      name_array = name_array.collect {|word| word.downcase}
      name_array.join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      artists = self.all
      artists.detect do |artist|
        artist.slug == slug
      end
    end
  end
end
