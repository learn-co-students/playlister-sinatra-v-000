module Slugifiable
  module InstanceMethods
    def slug
      self.name.parameterize
    end
  end

  module ClassMethods
    def self.find_by_slug(slug)
      self.all.find{|para| para.name.parameterize == slug}
    end
  end
end
