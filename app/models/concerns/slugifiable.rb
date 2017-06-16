module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
  end

  module ClassMethods
    def find_by_slug(tofind)
      self.all.find do |s|
        s.slug == tofind
      end
    end
  end

end
