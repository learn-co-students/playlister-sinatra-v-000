module Slugify
  module InstanceMethods
    def slug
      self.name.gsub(" ", "-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug_phrase)
      self.all.find {|obj_name| obj_name.slug == slug_phrase}
    end
  end
end
