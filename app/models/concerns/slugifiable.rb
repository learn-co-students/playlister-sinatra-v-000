module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
  end

  module ClassMethods
    def self.find_by_slug(slug)
      instance = nil
      self.all.each do |s|
        if i.slug == slug
          instance = i
        end
      end
      instance
    end
  end
end
