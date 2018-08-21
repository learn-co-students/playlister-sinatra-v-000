module Slugifiable
  module InstanceMethods
    def slug
      slug = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
      slug
    end
  end
  module ClassMethods
    def find_by_slug(name)
      match = nil
      slug = name.downcase.strip.gsub('-', ' ')
      self.all.each do |item|
        if item.name == slug
          match = item
          binding.pry
          return match
        end
      end
      binding.pry
      match
    end
  end
end