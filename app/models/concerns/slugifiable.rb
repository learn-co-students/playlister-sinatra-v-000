module Slug
  module InstanceMethods
    def slug
      self.name.downcase.split.join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.detect {|object_song| object_song.slug == slug}
    end
  end

end
