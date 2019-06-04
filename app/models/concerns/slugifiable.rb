module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      instance = nil
      self.all.each do |i|
        if i.slug == slug
          instance = i
        end
      end
      instance
    end
  end
end
