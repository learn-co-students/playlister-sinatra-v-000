module Slugable
  module InstanceMethods
    def slug
      self.name.gsub(" ", "-").downcase unless self.name.nil?
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find{|x| x.slug == slug}
    end
  end
end