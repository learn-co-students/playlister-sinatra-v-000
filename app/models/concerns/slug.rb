module Slug

  module InstanceMethods
    def slug
      self.name.gsub(" ", "-").downcase
     end
    end

  module ClassMethods
    def find_by_slug(name)
      self.all.find {|s| s.slug == name}
  end
 end
end
