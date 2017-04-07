module Slugifiable
  module InstanceMethdods

    def slug
      slug = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
  end

  module ClassMethods

    def find_by_slug(slug)
      self.all.detect {|instance| instance.slug == slug}
    end
  end
end
