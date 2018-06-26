module Slugifiable
  module InstanceMethods
    def slug
      self.name.split(" ").join("-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      artist_name = slug.split("-").map {|word| word.capitalize}.join(" ")
      self.find_by(name: artist_name)
    end
  end
end
