module Slugifiable
  module InstanceMethods
    def slug
      self.downcase.gsub(" ","-")
    end
  end

  module ClassMethods
    def self.find_by_slug(slug)
      self.all.find{|item| item.slug == slug}
    end
  end


end
