module Slugifiable

  module ClassMethods
    def find_by_slug(slug)
      self.all.find{|data| data.slug == slug}
    end

  end

  module InstanceMethods

    def slug
      self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
  end
end
