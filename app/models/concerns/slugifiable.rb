module Slugifiable
  module InstanceMethods

  def slug
    self.name.gsub(" ","-").downcase
  end
end

  module ClassMethods #no self in modules
    def find_by_slug(slug)
      self.all.detect {|artist| artist.name.gsub(" ","-").downcase == slug} #detect, NOT select, which returns an array instead of just the object.
    end
  end
end
