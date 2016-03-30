module Slugifiable
  module InstanceMethods
    def slug
      self.name.to_s.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug_arg)
      self.all.find do |item| 
        item.slug == slug_arg
      end
    end
  end

end