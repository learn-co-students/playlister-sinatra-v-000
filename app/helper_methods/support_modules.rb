module Slugs #include

  module InstanceMethods #include
    def slug
      self.name.gsub(/\s/,'-').downcase
      #self.name.split(" ").join("-")
    end
  end

  module ClassMethods #extend
    def find_by_slug(slug)
      self.all.find{|instance| instance.slug == slug}
    end
  end
 
 def self.included(receiver)
    receiver.extend ClassMethods
    receiver.send :include, InstanceMethods
  end
end