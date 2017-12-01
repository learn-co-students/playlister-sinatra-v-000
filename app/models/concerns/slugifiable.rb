module Slugifiable
  module ClassMethods
    def find_by_slug(slug)
      self.all.find { |object| object.slug == slug}
    end
  end

  module InstanceMethods
    def slug
      slugified = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
  end
end
