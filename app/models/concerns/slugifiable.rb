module Slugifiable

  module ClassMethods
    def find_by_slug(slugged)
      found = []
      self.all.each do |thing|
        if slugged == thing.slug
          found << thing
        end
      end
      found[0]
    end

  end

  module InstanceMethods
    def slug
      strip_chars_array = self.name.downcase.scan(/[a-z0-9]+/)
      slug = strip_chars_array.join("-")
    end
  end

end
