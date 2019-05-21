module Slugifiable 
  module ClassMethods
    def self.find_by_slug(slug)
      self.all.find {|obj| obj.slug == slug}
    end
  end
  
  module InstanceMethods
    def slug
      self.name.gsub(/\s/, '-').gsub(/[^a-zA-Z\d-]/, '').downcase
    end
  end

end