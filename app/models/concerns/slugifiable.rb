module Slugifiable
  module InstanceMethods
    def slug
      name = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
      name
    end
  end

  module ClassMethods
    def find_by_slug(name)
      self.all.find do |o|
        o.slug == name
      end
    end
  end

end
