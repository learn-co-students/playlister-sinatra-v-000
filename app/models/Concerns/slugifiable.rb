module Concerns::Slugifiable
  module ClassMethods
    def find_by_slug(slug)
      name = slug.split('-').map {|w| w.capitalize!}.join(' ')
      self.find_by(name: name)
    end
  end

  module InstanceMethods

    def slug
      self.name.gsub(' ','-').downcase
    end
  end

end
