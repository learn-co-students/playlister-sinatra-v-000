module Slugs

  module InstanceMethods
    def slug
      self.name.gsub(/\s/,'-').downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find{|instance| instance.slug == slug}
    end
  end

  def self.included(receiver)
    receiver.extend ClassMethods
    receiver.send :include, InstanceMethods
  end
end
