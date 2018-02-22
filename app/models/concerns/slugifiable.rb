module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.strip.gsub(/[^0-9A-Za-z]/,"-")
    end
  end
  module ClassMethods
    def find_by_slug(slug)
      self.all.detect{|instance|instance.slug==slug}
    end
  end
end
