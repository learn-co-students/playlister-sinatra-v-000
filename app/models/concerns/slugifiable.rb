module Slugifiable

  module InstanceMethods

    def slug
      name.downcase.gsub(' ', '-')
    end

  end

  module ClassMethods

    def find_by_slug(slug)
      self.all.detect{|a| a.slug == slug}
    end

  end

end
