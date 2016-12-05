module Slugifiable
  module ClassMethods
    def find_by_slug(slug)
      self.all.find {|object| object.slug == slug}
    end
  end
  
  module InstanceMethods
    def slug
      slug_name = self.name.downcase.scan(/[a-z]*/).reject! {|i| i.empty?}
      slug_name.join("-")
    end
  end
end
