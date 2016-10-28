module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.tr(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug_name)
      self.all.find {|a| a.slug == slug_name}
    end
  end
end
