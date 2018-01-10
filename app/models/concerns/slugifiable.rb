module Slugifiable
  module ClassMethods
    def find_by_slug(slug)
      self.all.detect{|o| o.slug == slug}
    end
  end
  module InstanceMethods
    def slug
      self.name.downcase.strip.gsub("$","s").gsub(/\s/,"-").gsub(/[^\w-]/,"")
    end
  end
end
