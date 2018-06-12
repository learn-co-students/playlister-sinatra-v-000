module Slug
  module InstanceMethods
    def slug
      self.name.split(' ').join('-').downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      full_name = slug.split('-').collect{|name| name.capitalize}.join(' ')
      self.find_by(name: full_name)
    end
  end
end