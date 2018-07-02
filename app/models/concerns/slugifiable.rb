require 'pry'
module Slugifiable

  module ClassMethods
    def find_by_slug(slug)
      res=self.all.find {|item| item.slug==slug}
      res
    end
  end

  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ","-")
    end
  end


end
