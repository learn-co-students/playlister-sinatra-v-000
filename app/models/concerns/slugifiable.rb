module Slugifiable 
  module InstanceMethods
    def slug 
      self.name.gsub(" ", "-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slugged_name)
      self.all.detect do |x|
        x.slug == slugged_name
      end
    end
  end
end