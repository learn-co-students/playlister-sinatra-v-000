module Slugifiable
  module InstanceMethods
    def slug
      self.name.strip.downcase.gsub(' ', '-')
    end
  end
  module ClassMethods
    def find_by_slug(slug)
      self.all.each do |instance|
        return instance if instance.slug == slug
      end
      nil
    end
  end
end
