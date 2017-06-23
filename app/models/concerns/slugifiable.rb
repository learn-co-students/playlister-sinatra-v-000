module Slugifiable

  module InstanceMethods
    def slug
      self.name.downcase.gsub(' ', '-')
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.detect {|instance| instance.slug == slug}
      # self.where(lower(name))
    end
  end

end
