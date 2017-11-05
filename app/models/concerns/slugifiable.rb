module Slugifiable

  module ClassMethods
    def find_by_slug(name)
      self.all.detect {|a| a.slug == name}
    end
  end

  module InstanceMethods
    def slug
      self.name.downcase.gsub(' ','-')
    end
  end

end
