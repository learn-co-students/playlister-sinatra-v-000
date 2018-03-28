module Slugify
  module InstanceMethods
    def slug
      self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.select do |i|
        i.slug == slug
      end.first
    end
  end
end
