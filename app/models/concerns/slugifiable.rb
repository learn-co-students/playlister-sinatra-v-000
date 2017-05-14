module Slugifiable

  module ClassMethods
    def find_by_slug(slug)
      self.all.find do |item|
        item.slug == slug
      end
    end
  end

  module InstanceMethods
    def slug
      out = self.name.gsub(/[^a-zA-Z\d\s]/,"")
      out.gsub!(" ", "-")
      out.downcase
    end
  end

end
